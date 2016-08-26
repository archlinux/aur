# Maintainer:  raingloom <raingloom42@gmail.com>
pkgname=openresty_luarocks
_pkgname=luarocks
pkgver=2.3.0
pkgrel=2
pkgdesc="Deployment and management system for Openresty Luajit 2.1 modules"
arch=('any')
url="http://luarocks.org/"
license=('custom')
depends=('openresty' 'zip' 'unzip' 'curl')
install=
options=('!makeflags')
source=(http://keplerproject.github.io/luarocks/releases/luarocks-$pkgver.tar.gz)
noextract=()
sha256sums=( '68e38feeb66052e29ad1935a71b875194ed8b9c67c2223af5f4d4e3e2464ed97' )

optdepends=('cvs: for fetching sources from CVS repositories'
            'git: for fetching sources from git repositories'
            'mercurial: for fetching sources from mercurial repositories'
            'cmake: for building rocks that use the cmake build system')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/opt/openresty/luajit \
    --with-lua=/opt/openresty/luajit/ \
    --lua-suffix=jit-2.1.0-beta2\
    --force-config \
    --lua-version=5.1 \
    --with-lua-include=/opt/openresty/luajit/include/luajit-2.1
  make build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
