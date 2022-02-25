# Maintainer: sukanka <su975853527 AT gmail dot com>

pkgname=citespace
pkgver=6.0.R1
pkgrel=4
pkgdesc="A widely used tool for visual exploration of scientific literature."
arch=('any')
url="https://citespace.podia.com/"
license=('unknown')
depends=('java-runtime>=11.0.11')
makedepends=('unzip' 'imagemagick')
optdepends=('mysql: for data cleansing')
source=("${pkgname}-${pkgver}.zip::https://citespace.podia.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBd0JCS0E9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--902889e4a656706776e6cb9c7d4b08a6e180e64e/6.0.R1%20Advanced.zip"
"$pkgname".desktop
"$pkgname".sh
)
sha256sums=('83a4d58d1f522d4cb543f69a37907eb882fb18226ba5140ffa1ff377122247d3'
            '5256f6866d830da93fd5439d45ae8b35f45806d19e7c86830e8d2db07fa5c83d'
            'e23977204063d4837a50f3ecc45d67afe5a1d1aa672b145ab60fed073ee3bdf9')
prepare() {
    cd $srcdir
    unzip -o *.jar resources/logo.png -d $srcdir
    convert  -resize 64 $srcdir/resources/logo.png $srcdir/${pkgname}.png
}

package(){
    cd $srcdir
    install -Dm644  *.jar    ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
    install -Dm644  "$pkgname".desktop -t      ${pkgdir}/usr/share/applications
    install -Dm644  ${pkgname}.png     -t \
        ${pkgdir}/usr/share/icons/hicolor/64x64/apps
    install -Dm755  "$pkgname".sh              ${pkgdir}/usr/bin/$pkgname
}
