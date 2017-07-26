# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=casync
pkgver=2
pkgrel=1
pkgdesc="Content-Addressable Data Synchronization Tool"
arch=(x86 x86_64)
url="https://github.com/systemd/casync"
license=('LGPL')
depends=('acl' 'libcurl.so' 'libgcrypt' 'xz' 'fuse2' 'libselinux' 'zlib' 'zstd')
makedepends=('meson' 'python-sphinx')
optdepends=()
checkdepends=('rsync')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a5f79ee3ccae2df42cce662c36edc7047aebacd3a9c029ee9a859adfa7a68d00')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson --buildtype=release --prefix=/usr build/
  ninja -C build/
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"
  mesontest
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build/ install
}
