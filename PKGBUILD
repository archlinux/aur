# Maintainer:  Michael Lass <bevan@bi-co.net>
# Contributor: Hector Mtz-Seara <hseara.at.gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Christian Storm <Christian.Storm@gmx.de>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=jabref
pkgver=4.1
pkgrel=2
pkgdesc="GUI frontend for BibTeX, written in Java"
arch=('any')
url="https://www.jabref.org/"
license=('MIT')
depends=('archlinux-java-run>=4' 'java-openjfx>=8' 'java-openjfx<9')
optdepends=(
   'gsettings-desktop-schemas: For web search support'
)
source=(https://github.com/JabRef/jabref/releases/download/v${pkgver}/JabRef-${pkgver}.jar
        https://raw.githubusercontent.com/JabRef/jabref/v${pkgver}/LICENSE.md
        jabref.sh
        jabref.desktop)
noextract=(JabRef-${pkgver}.jar)
sha256sums=('48761690dc024ec56864fb4b1a43687e1fcddd18babb0c9037a54e6a021b4db9'
            'd0a8248eeaafc526f1137703fdc5aac1c8fae106f94c4bef56e3650e2c4c73a7'
            'c88d83bd310f5824ba8fbfad08c128b60aac3509a8302aabc0ac429d3a51738d'
            'a26845ba60ef2588c52d7d18259a977b146c777f935573bacdffcdcefa2b41b5')

prepare() {
  cd ${srcdir}
  bsdtar -xf JabRef-${pkgver}.jar icons/${pkgname}.svg
}

package() {
  cd ${srcdir}
  install -Dm755 JabRef-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/JabRef-${pkgver}.jar

  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/${pkgname}

  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 icons/${pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/jabref/LICENSE.md
}
