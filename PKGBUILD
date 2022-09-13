# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

pkgname=pololu-jrk-g2-software
pkgver=1.4.0
pkgrel=2
pkgdesc="Software and drivers for the Pololu Jrk G2 USB Motor Controllers with Feedback."
arch=('i686' 'x86_64')
url="https://github.com/pololu/$pkgname"
license=('custom')
depends=('qt5-base' 'libusbp-1')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz" "$url/pull/2.patch")
sha256sums=('80eab300ba9e0efd573c22fbe545ef985ab92d7effb5d3297922e1835cc749cb' '3578e77df0ee3002c0bf452e6beec18ad5e80860f3f7697ca2b539f0c95a6832')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 -i "$srcdir/2.patch"
}

build() {
    cd "$pkgname-$pkgver"

    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 udev-rules/99-pololu.rules "$pkgdir/etc/udev/rules.d/99-pololu.rules"
}
