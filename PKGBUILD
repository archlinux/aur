# Maintainer: sukanka <su975853527 AT gmail dot com>

pkgname=citespace
pkgver=6.2.R2
pkgrel=1
pkgdesc="A widely used tool for visual exploration of scientific literature."
arch=('any')
url="https://citespace.podia.com/"
license=('unknown')
depends=('java-runtime>=11.0.11')
makedepends=('p7zip' 'libicns')
optdepends=('mysql: for data cleansing')
source=("${pkgname}-${pkgver}.dmg::https://citespace.podia.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBL0FmWWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--43a20d86f7b5ffc2b4237cb3dda4ac3cd8e68850/CiteSpace-6.2.2.dmg"
"$pkgname".desktop
"$pkgname".sh
)
sha256sums=('fc3630c04068946b7661803e475c4a2bb7cab80a5fbaa1da51a39c4b8fe9c205'
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
