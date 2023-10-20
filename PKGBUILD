# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: xiliuya <xiliuya@aliyun.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>
pkgname=ffdec
pkgver=19.1.2
pkgrel=1
pkgdesc="Open source Flash SWF decompiler and editor"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler/releases"
license=('GPL3')
depends=('java-runtime>=8')
source=(https://github.com/jindrapetrik/jpexs-decompiler/releases/download/version${pkgver}/${pkgname}_${pkgver}.zip
        $pkgname
        $pkgname.desktop
        $pkgname.png)
md5sums=('e1efb304c511ebd29c075f3f6b1f07de'
         'bbf0428af149a21ea8d837506f91c6e8'
         '1630ed36db9aadb2325b8ad9eb00f2de'
         'decfc4be2e1ce355c267049ae332419c')

package() {
    cd "$srcdir"
    install -Ddm755 "${pkgdir}/usr/share/java/${pkgname}/lib"
    install -Ddm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    cd "$srcdir/lib"
    for f in *.license.txt; do
        cp -d --no-preserve=ownership "$f" "${pkgdir}/usr/share/licenses/${pkgname}/$f"
    done
    for f in *.jar; do
        cp -d --no-preserve=ownership "$f" "${pkgdir}/usr/share/java/${pkgname}/lib/$f"
    done
}
