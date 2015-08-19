# Maintainer:  system <nymously.ano@gmail.com>
pkgname=openresty_luarocks
_pkgname=luarocks
pkgver=2.2.2
pkgrel=1
pkgdesc="Deployment and management system for Openresty Luajit 2.1 modules"
arch=('any')
url="http://luarocks.org/"
license=('custom')
depends=('openresty' 'zip' 'unzip' 'curl')
install=
options=('!makeflags')
source=(http://keplerproject.github.io/luarocks/releases/luarocks-$pkgver.tar.gz)
noextract=()
sha256sums=( '4f0427706873f30d898aeb1dfb6001b8a3478e46a5249d015c061fe675a1f022')
optdepends=('cvs: for fetching sources from CVS repositories'
            'git: for fetching sources from git repositories'
            'mercurial: for fetching sources from mercurial repositories'
            'cmake: for building rocks that use the cmake build system')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/opt/openresty/luajit \
    --with-lua=/opt/openresty/luajit/ \
    --lua-suffix=jit-2.1.0-alpha \
    --with-lua-include=/opt/openresty/luajit/include/luajit-2.1
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
