# Maintainer: Biggs <biggs at sergeantbiggs dot net>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: raingloom <raingloom42@gmail.com>

pkgname=openresty_luarocks
_pkgname=luarocks
pkgver=3.12.0
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
b2sums=('b18095f1f810f97b6b1df89c55027002814fbfb3d2f64b80cafef6a25988cea5e4994b96ebe47243e519512e6260454fd5693f7021de62cfff8f496a64b86839'
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
