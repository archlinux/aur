# Maintainer: xiliuya <xiliuya@aliyun.com>
# Co-maintainer: xrtxn <mihok.martin@protonmail.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>
pkgname=ffdec-bin
pkgver=24.1.1
pkgrel=1
pkgdesc="Open source Flash SWF decompiler and editor"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler/releases"
license=('GPL3')
provides=('ffdec')
depends=('java-runtime>=8')
conflicts=('ffdec')
source=("${pkgname%-bin}_${pkgver}.zip::https://github.com/jindrapetrik/jpexs-decompiler/releases/download/version${pkgver}/${pkgname%-bin}_${pkgver}.zip"
        ${pkgname%-bin}
        ${pkgname%-bin}-java8
        ${pkgname%-bin}.desktop
        ${pkgname%-bin}.png)
md5sums=('84c57480101d73976803e7d73089998a'
         '21b247c479b500fffdd0f1b306237b50'
         'b548b3503cae1f8948b44bec1d658e53'
         '1630ed36db9aadb2325b8ad9eb00f2de'
         'decfc4be2e1ce355c267049ae332419c')

package() {
    cd "$srcdir"
    install -Ddm755 "${pkgdir}/usr/share/java/${pkgname%-bin}/lib"
    install -Ddm755 "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
    install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${pkgname%-bin}-java8" "${pkgdir}/usr/bin/${pkgname%-bin}-java8"
    install -Dm644 "${pkgname%-bin}.jar" "${pkgdir}/usr/share/java/${pkgname%-bin}/${pkgname%-bin}.jar"
    install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/license.txt"
    install -Dm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    cd "$srcdir/lib"
    for f in *.license.txt; do
        cp -d --no-preserve=ownership "$f" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/$f"
    done
    for f in *.jar; do
        cp -d --no-preserve=ownership "$f" "${pkgdir}/usr/share/java/${pkgname%-bin}/lib/$f"
    done
}
