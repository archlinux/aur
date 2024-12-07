# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

pkgname=pololu-jrk-g2-software
pkgver=1.4.1
pkgrel=1
pkgdesc="Software and drivers for the Pololu Jrk G2 USB Motor Controllers with Feedback."
arch=('i686' 'x86_64')
url="https://github.com/pololu/$pkgname"
license=('custom')
depends=('qt5-base' 'libusbp-1')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c15071a1aa523d5a84de0bda81740af857cd28a9718f65e6b92cfd8c7ff568d6')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev

    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname-$pkgver/udev-rules/99-pololu.rules" "$pkgdir/etc/udev/rules.d/99-pololu.rules"
}
