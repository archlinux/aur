# Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
pkgname=casync
pkgver=1
pkgrel=1
pkgdesc="Content-Addressable Data Synchronization Tool"
arch=(x86 x86_64)
url="https://github.com/systemd/casync"
license=('LGPL')
depends=('acl' 'libcurl.so' 'libgcrypt' 'xz')
makedepends=('meson')
optdepends=()
checkdepends=('rsync')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('34251880f06f4625b92ee0cbcd2aafc426e5e5367f43a1a3c0551484eef62b00')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson --buildtype=release --prefix=/usr build/
  ninja -C build/
}

#check() {
#  cd "$srcdir/$pkgname"
#  ninja -C build/ test
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build/ install
}
