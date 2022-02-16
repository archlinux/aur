# Maintainer: sukanka <su975853527 AT gmail dot com>

pkgname=citespace
pkgver=6.0.R1
pkgrel=2
pkgdesc="A widely used tool for visual exploration of scientific literature."
arch=('any')
url="https://citespace.podia.com/"
license=('unknown')
depends=('java-runtime>=11.0.11')
makedepends=('unzip' 'imagemagick')
optdepends=('mysql: for data cleansing')
source=("${pkgname}-${pkgver}.7z::https://citespace.podia.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMm12Snc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--d2da070aa50620ad4df65b37191a859c73c831c4/6.0.R1.7z"
"$pkgname".desktop
"$pkgname".sh
)
sha256sums=('133974e4a5e4caacc6f7bec608cff539e650e884ec0f5386951a7f6ae54452cf'
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
