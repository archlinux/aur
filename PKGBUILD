# Maintainer: Kazuki Sawada <kazuki@6715.jp>
# Contributor: raingloom <raingloom42@gmail.com>

pkgname=openresty_luarocks
_pkgname=luarocks
pkgver=3.3.1
pkgrel=2
pkgdesc="Deployment and management system for Openresty Luajit 2.1 modules"
arch=('any')
url="http://luarocks.org/"
license=('custom')
depends=('openresty'
         'coreutils' # need chmod, md5sum
         'curl' # need one of curl or wget
         'lua'
         'unzip' # need unzip and zip or lua-zlib
         'zip')
optdepends=('cvs: for fetching sources from CVS repositories'
            'git: for fetching sources from git repositories'
            'mercurial: for fetching sources from mercurial repositories'
            'cmake: for building rocks that use the cmake build system'
            'lua-sec: HTTPS support')
source=("https://luarocks.org/releases/$_pkgname-$pkgver.tar.gz")
md5sums=('1dc12df0b4dc312625a0d36b194b76ef')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/opt/openresty/luajit \
    --with-lua=/opt/openresty/luajit/ \
    --lua-suffix=jit \
    --force-config \
    --lua-version=5.1 \
    --with-lua-include=/opt/openresty/luajit/include/luajit-2.1
  make build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
