# Maintainer: sukanka <su975853527 AT gmail dot com>

pkgname=citespace
pkgver=5.8.R3
pkgrel=2
pkgdesc="A widely used tool for visual exploration of scientific literature."
arch=('any')
url="http://cluster.cis.drexel.edu/~cchen/citespace/"
license=('unknown')
depends=('java-runtime')
makedepends=('unzip' 'imagemagick')
optdepends=('mysql: for data cleansing')
source=("${pkgname}-${pkgver}.zip::https://citespace.podia.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMlJnSVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--67464dd11df7de3b743fc702b937aed728071897/5.8.R3.zip"
"$pkgname".desktop
"$pkgname".sh
)
sha256sums=('8d534ba008d088d2176faa741f9d8eca6ed563b49912c38450de9df3a2d11da3'
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
