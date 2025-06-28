# Maintainer: Biggs <biggs at sergeantbiggs dot net>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: raingloom <raingloom42@gmail.com>

pkgname=openresty_luarocks
_pkgname=luarocks
pkgver=3.12.2
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
b2sums=('38cede07aa8cab8ffb205a3326b28bc353b08c253c0a5f96e75d73c97785a55a5fd43048213701ab79b2a746f715d6b865f743ed68963a782f65af4bacb4ef0a'
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
