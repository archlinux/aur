# Maintainer: sukanka <su975853527 AT gmail dot com>

pkgname=citespace
pkgver=6.2.R6
pkgrel=1
pkgdesc="A widely used tool for visual exploration of scientific literature."
arch=('any')
url="https://citespace.podia.com/"
license=('unknown')
depends=('java-runtime>=11.0.11')
makedepends=('p7zip' 'libicns')
optdepends=('mysql: for data cleansing')
source=("${pkgname}-${pkgver}.dmg::https://citespace.podia.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBN3F0aFE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--ae3d7d47b6e26ac837f993cc4b598dc43187f43b/CiteSpace-6.2.6.dmg"
"$pkgname".desktop
"$pkgname".sh
)
sha256sums=('adda82b66aa920402f6bb883fde661abef98a12d16e11c4bfe6aeafb70e1daf3'
            '5256f6866d830da93fd5439d45ae8b35f45806d19e7c86830e8d2db07fa5c83d'
            'e23977204063d4837a50f3ecc45d67afe5a1d1aa672b145ab60fed073ee3bdf9')
prepare() {
    cd $srcdir
    install -d out
    mv ${pkgname}-${pkgver}.dmg out
    cd out
    7z x ${pkgname}-${pkgver}.dmg
    cd CiteSpace/CiteSpace.app/Contents/

    mv app/*.jar ${srcdir}/${pkgname}.jar
    mv Resources/*.icns ${srcdir}/${pkgname}.icns
    cd $srcdir
    mkdir icon
    icns2png -x -o icon ${pkgname}.icns
}

package(){
    cd $srcdir
    install -Dm644  *.jar    ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
    install -Dm644  "$pkgname".desktop -t      ${pkgdir}/usr/share/applications
    install -Dm644  icon/*.png     -t \
        ${pkgdir}/usr/share/icons/hicolor/512x512/apps
    install -Dm755  "$pkgname".sh              ${pkgdir}/usr/bin/$pkgname
}
