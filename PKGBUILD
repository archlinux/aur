# Maintainer: Biggs <biggs@sergeantbiggs.net>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: raingloom <raingloom42@gmail.com>

pkgname=openresty_luarocks
_pkgname=luarocks
pkgver=3.3.1
pkgrel=3
pkgdesc="Deployment and management system for Openresty Luajit 2.1 modules"
arch=('any')
url="http://luarocks.org/"
license=('MIT')
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
source=("https://luarocks.org/releases/$_pkgname-$pkgver.tar.gz"{,.asc})
b2sums=('fd34d7a233bbf1c5f224bd04886a7f1382d63ffc014c8b78ae7924fb799d66a32e048298deed103686771263885c85c9173c013d1bbb3bad6a48e9fd99fdaac0'
         'SKIP')

validpgpkeys=('8460980B2B79786DE0C7FCC83FD8F43C2BB3C478')

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
