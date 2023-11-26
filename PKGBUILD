# Maintainer: diaowinner <diaowinner@gmail.com>
# Maintainer: KreativeKorp <support@kreativekorp.com>
pkgname=hexcellent-git
pkgver=1.0.r41.0184952
pkgrel=1
pkgdesc="Kreative Hexcellent, in the latest snapshot version"
arch=("any")
url="https://github.com/kreativekorp/hexcellent"
license=("MPL")
depends=("java-runtime" "hicolor-icon-theme" "xdg-utils" "bash" "libxrender" "libxtst" "fontconfig" "xorg-mkfontscale" "ttf-font")
makedepends=("jdk-openjdk" "make" "git")
provides=("hexcellent")
source=(
"${pkgname}::git+https://github.com/kreativekorp/hexcellent.git#branch=main"
"hexcellent" "hexcellent.desktop"
)
sha256sums=("SKIP"
"e162dcb2e837e8403aca06abb9940e755744bd436c73abf1750e072148b5ef48" "ebcfcd391126ad3243775f771a4ad41092095ff0b3eb80de6d74535467ab3d7c"
)

pkgver(){
cd "${srcdir}/${pkgname}"
printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cd "${srcdir}/${pkgname}/java/Hexcellent"
make clean bin hexcellent.jar
}

package() {
  install -D -m644 -T "${srcdir}/${pkgname}/java/Hexcellent/hexcellent.jar" "${pkgdir}/usr/lib/hexcellent.jar"
  install -D -m755 -T "${srcdir}/hexcellent" "${pkgdir}/usr/bin/hexcellent"
  install -D -m644 -T "${srcdir}/${pkgname}/java/Hexcellent/dep/hexcellent.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/hexcellent.png"
  install -D -m644 -T "${srcdir}/hexcellent.desktop" "${pkgdir}/usr/share/applications/hexcellent.desktop"

  # That should work...
  ln -sf "${pkgdir}/usr/local/lib/hexcellent.jar" "${pkgdir}/usr/lib/hexcellent.jar"
  ln -sf "${pkgdir}/usr/local/bin/hexcellent"  "${pkgdir}/usr/bin/hexcellent"
}
