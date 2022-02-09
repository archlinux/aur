# Maintainer: sukanka <su975853527 AT gmail dot com>

pkgname=citespace
pkgver=5.8.R4
pkgrel=1
pkgdesc="A widely used tool for visual exploration of scientific literature."
arch=('any')
url="https://citespace.podia.com/"
license=('unknown')
depends=('java-runtime>=11.0.11')
makedepends=('unzip' 'imagemagick')
optdepends=('mysql: for data cleansing')
source=("${pkgname}-${pkgver}.7z::https://citespace.podia.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBL0E5Snc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--c6240732f70f6a16a48af2eb2459e2025e6234d9/5.8.R4.7z"
"$pkgname".desktop
"$pkgname".sh
)
sha256sums=('0dc9f26c7b99ba96888bd187dfd542febd7711a50bd25b07dd72ec7b43ff280d'
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
