# Maintainer:  Michael Lass <bevan@bi-co.net>
# Contributor: Hector Mtz-Seara <hseara.at.gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Christian Storm <Christian.Storm@gmx.de>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=jabref
pkgver=3.7
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java"
arch=('any')
url="http://www.jabref.org/"
license=('GPL')
depends=('java-runtime>=8')
optdepends=(
   'gsettings-desktop-schemas: For web search support'
)
source=(https://github.com/JabRef/jabref/releases/download/v${pkgver}/JabRef-${pkgver}.jar
        jabref.sh
        jabref.desktop)
noextract=(JabRef-${pkgver}.jar)
sha256sums=('1475552e2956b7a94cbab7b6c8671fc391be0d42cfa1ece3aed75dd0a8c1ecf3'
            '0355f5135a6d855416160d4ff1cf8fe5e55921088b83491647b6a714dae87dda'
            'f958793f6e408bab7db84973169b30ed61077112d3f552dbcc9f068847317602')

prepare() {
  cd ${srcdir}
  bsdtar -xf JabRef-${pkgver}.jar images/icons/JabRef-icon-48.png
}

package() {
  cd ${srcdir}
  install -Dm755 JabRef-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/JabRef-${pkgver}.jar

  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/${pkgname}

  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 images/icons/JabRef-icon-48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
