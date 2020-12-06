# Maintainer: redtide <redtid3@gmail.com>
# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>

pkgname=jknobman-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="VSTGUI - AnimationKnob Design tool"
conflicts=("jknobman" "jknobman-git")
url="https://www.g200kg.com/jp/software/knobman.html"
arch=('any')
license=('custom')
depends=('java-runtime')
makedepends=("unzip" "aspectj")
source=("https://github.com/g200kg/KnobMan/raw/master/JKnobMan133-jar.zip"
        "jknobman" "JKnobMan.desktop" "KnobmanXdgConfig.aj")
sha256sums=('85acce3104f1a95bf8aa578dff640b427b114d6114e7556f4c65b2db08f3ed80'
            '2eb7799428f6f80be28f872213f354d5b435b0fa7794b9e3c96f5f7b2fac0048'
            'a7baf9a105ba69c08defc818e07245461b6c3eb7b558e9280c0813d89dd9aa37'
            '9a6781e2db9d8fb17789bf94599048b14831fe4f64959df33a6002f17cb5127c')
build() {
    /opt/aspectj/bin/ajc -outjar JKnobMan-mod.jar \
        -inpath ${srcdir}/JKnobMan.jar:/opt/aspectj/lib/aspectjrt.jar \
        KnobmanXdgConfig.aj
}
package() {
    mkdir -p "${pkgdir}/usr/share/JKnobMan"
    unzip -q "JKnobMan133-jar.zip" -d "${pkgdir}/usr/share/JKnobMan"
    install -Dm755 "${srcdir}/jknobman" "${pkgdir}/usr/bin/jknobman"
    install -Dm644 "${srcdir}/JKnobMan-mod.jar" "${pkgdir}/usr/share/JKnobMan/JKnobMan.jar"
    install -Dm644 "${srcdir}/JKnobMan.desktop" "${pkgdir}/usr/share/applications/JKnobMan.desktop"
}
