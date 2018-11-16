# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
# Contributor: Nathan Osman <nathan at quickmediasolutions dot com>
# Contributor: BlackEagle <ike.devolder@gmail.com>

pkgname='nitroshare'
pkgver='0.3.4'
pkgrel=2
pkgdesc='Network File Transfer Application'
url='https://nitroshare.net'
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('cmake')
depends=('qt5-base' 'qt5-tools' 'qt5-svg')
optdepends=(
    'libappindicator-gtk2: export a menu into the Unity Menu bar'
    'qhttpengine: allow local applications access'
    'qmdnsengine: enable mDNS discovery'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/nitroshare/nitroshare-desktop/archive/$pkgver.tar.gz"
    "qt-5.11.patch"
)
sha256sums=('29874e5909c29211a3c9e13f8c0f49b901ec2996e5d60d80af80d2fb80c3d7ec'
            'e2a8417f36a5df37c5fb34c1a371f86b0059f48bf6dd588fc776ca7c38a67cd5')

prepare() {
    cd "$pkgname-desktop-$pkgver"
    patch -Np1 -i ../qt-5.11.patch
}

build() {
    cd "$pkgname-desktop-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make
}

package() {
    cd "$pkgname-desktop-$pkgver"
    make DESTDIR="$pkgdir" install

    # license
    install -Dm644 \
        "LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
