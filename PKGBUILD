# Maintainer: David McInnis <dave@dave3.xyz>

pkgname=('imageplay')
pkgver='6.1.0'
pkgrel=1
pkgdesc="rapid prototyping application for image processing."
url="http://imageplay.io/"
depends=('qt5-base' 'freeimage' 'opencv')
makedepends=('')
license=('GPL3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cpvrlab/ImagePlay/archive/${pkgver}.tar.gz")
sha256sums=('6797a84fd28612e1fdfa95430cbcdb8d4921caf244f49b3e006a50d658a4238e')

build() {
    cd "${srcdir}/ImagePlay-${pkgver}"
    qmake-qt5 -recursive
    QT_SELECT=5 make
}


package() {
    cd "${srcdir}/ImagePlay-${pkgver}"
    install -D -m644 license.md "${pkgdir}/usr/share/licenses/imageplay/license.md"
    mkdir "$pkgdir/opt"
    cp -ar "_bin/Release/linux"  "$pkgdir/opt/imageplay"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/imageplay/imageplay"  "$pkgdir/usr/bin/imageplay"
}
