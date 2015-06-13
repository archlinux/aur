# Maintainer:  Ainola
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Maxence Sartiaux <makz@sartiaux.be>

pkgname=feedthebeast
pkgver=1.4.8_337
pkgrel=1
epoch=1
pkgdesc="Feed The Beast offers many different styles of Minecraft modpacks to the community, catering to all tastes."
arch=('any')
url=('http://feed-the-beast.com/')
license=('Apache')
depends=('java-runtime' 'hicolor-icon-theme' 'xorg-xrandr' 'ttf-dejavu')
makedepends=('libicns')
install=("${pkgname}.install")
source=("$pkgname"
        "${pkgname}.jar"::"http://ftb.cursecdn.com/FTB2/maven/net/ftb/FTB_Launcher/${pkgver/_/-}/FTB_Launcher-${pkgver/_/-}.jar"
        "${pkgname}.desktop"
        "${pkgname}.install")
noextract=("${pkgname}.jar")
sha256sums=('35ebb0e4fc8a581c2aa6e939527f238800f4059bb5253c67eb3d478c463010b0'
            'd30ce43c99a4fa2a133c03401143052d76634d89e4a22340b781c98548c5a466'
            '4dc05fcbad49c8d6d8d3143969c8f9c7e26d22ad72979f73c2d3c2b3a23a426d'
            'dfb83978fea9eddd28c2d90ab9eefa9554d5ae03dfc540554a829ac8ee8db83a')

package() {
    install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # icons are trapped inside .icns format, free them.
    bsdtar -xf "${pkgname}.jar" app/icon.icns
    icns2png -x app/icon.icns
    for size in 16 32 48 128 256; do
        install -Dm644 "icon_${size}x${size}x32.png" \
          "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
