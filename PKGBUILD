# Maintainer: adamanteye <ada@adamanteye.cc>
# Contributor: Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astroimagej
pkgver=5.5.1
pkgrel=1
pkgdesc="A simple and powerful tool for astronomical image analysis and precise photometry."
arch=('x86_64')
url="http://www.astro.louisville.edu/software/astroimagej/"
depends=('java-runtime')
license=('GPL')
source=(
    "${url}installation_packages/AstroImageJ_v${pkgver}.00-linux-x86_64Bit.tar.gz"
    "aij"
    "astroimagej.desktop"
)
sha256sums=(
    'ce31179cfff8ee8d7642a2088df1292c3a691a172131c31d83ed2c9123008ce4'
    '402dff16ffd0cb1c12b091bddbb75621a245c83632675f6dacd3ffb76fc3f155'
    '1b32cc64c00ce92daef1d14bfaf37868f4d0f3b4949f1d5a824cf32aee1c1f87'
)
package() {
    cd ${srcdir}
    tarfile="AstroImageJ_v${pkgver}.00-linux-x86_64Bit.tar.gz"
    mkdir ${pkgdir}/opt
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    install -m755 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    cp $tarfile ${pkgdir}/opt
    cd ${pkgdir}/opt
    tar zxvf $tarfile
    rm $tarfile
    mv ${pkgdir}/opt/AstroImageJ ${pkgdir}/opt/astroimagej
    install -m755 ${pkgdir}/opt/astroimagej/AstroImageJ.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
    cd ${srcdir}
    install -D -m755 aij ${pkgdir}/usr/bin/aij
}
