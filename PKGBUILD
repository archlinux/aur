# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
# Contributor: Nathan Osman <nathan at quickmediasolutions dot com>
# Contributor: BlackEagle <ike.devolder@gmail.com>

pkgname='nitroshare'
pkgver='0.3.3'
pkgrel=3
pkgdesc='Network File Transfer Application'
url='https://nitroshare.net'
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('cmake')
depends=('qt5-base' 'qt5-tools' 'qt5-svg')
optdepends=(
    'libappindicator-gtk2: export a menu into the Unity Menu bar'
    'qhttpengine: allow local applications access'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/nitroshare/nitroshare-desktop/archive/$pkgver.tar.gz"
)
sha256sums=('98a2a3faa53cad34e09777507ddf254f804f680a74d9aa4d33b445047796d02c')

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
