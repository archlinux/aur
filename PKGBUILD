# Maintainer: robertoszek <robertoszek@robertoszek.xyz>
pkgname=hs80tray
pkgver=0.9.2
pkgrel=1
pkgdesc="Tray indicator for Corsair HS80 Headset."
arch=("any")
install=reload-udev-rules.install
url="https://github.com/robertoszek/$pkgname"
license=("MIT")
depends=(qt6-base hidapi)
makedepends=(git cmake)
conflicts=("${pkgname}" "${pkgname}-git")
source=("git+https://github.com/robertoszek/hs80tray.git#tag=${pkgver}")
sha256sums=("SKIP")

build() {
  mkdir -p "$srcdir/$pkgname"/build
  cd "$srcdir/$pkgname"/build
  cmake ..
  make
  
}

package() {
  cd "${srcdir}/$pkgname"/build
  install -d $pkgdir/usr/bin
  make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir/usr" prefix=$pkgdir/usr install
  install -Dm644 "${srcdir}/${pkgname}/99-corsair-hid.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
}

