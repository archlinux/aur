# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=casync
pkgver=2
pkgrel=4
pkgdesc="Content-Addressable Data Synchronization Tool"
arch=(x86 x86_64)
url="https://github.com/systemd/casync"
license=('LGPL')
depends=('acl' 'fuse2' 'libcurl.so' 'libgcrypt' 'libselinux' 'xz' 'zlib' 'zstd')
makedepends=('meson' 'python-sphinx')
optdepends=()
checkdepends=('rsync')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" 'renameat2-test-fix.patch')
sha256sums=('a5f79ee3ccae2df42cce662c36edc7047aebacd3a9c029ee9a859adfa7a68d00'
            '3fb0fc4965039d0fc5b51c8fe49bb7ad74108324ff921c6f5b74127036c28d51')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/renameat2-test-fix.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  arch-meson build/
  ninja -C build/
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver/build"
#  meson test
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build/ install
}
