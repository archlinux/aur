# Maintainer:  Michael Lass <bevan@bi-co.net>
# Contributor: Hector Mtz-Seara <hseara.at.gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Christian Storm <Christian.Storm@gmx.de>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=jabref
pkgver=3.8.2
pkgrel=4
pkgdesc="GUI frontend for BibTeX, written in Java"
arch=('any')
url="https://www.jabref.org/"
license=('MIT')
depends=('archlinux-java-run' 'java-runtime=8')
optdepends=(
   'gsettings-desktop-schemas: For web search support'
)
source=(https://github.com/JabRef/jabref/releases/download/v${pkgver}/JabRef-${pkgver}.jar
        https://raw.githubusercontent.com/JabRef/jabref/v${pkgver}/LICENSE.md
        jabref.sh
        jabref.desktop)
noextract=(JabRef-${pkgver}.jar)
sha256sums=('f7226e9eb64f96ef2d179c4b1f9e9bcd7a630d247f2feb0ecaa243408379720a'
            '19f74c294c572a431e0fadc00671aa5ca77149f8d0572fc01d5944eba06b0c6c'
            'd35707a30af6f7e7a4216aef194a71e0905c75e384c150ab373192a75d08f60b'
            'ef8e6b956233304e98b2b08e8020e8c551e07e8a390eafc1e691991faa09a818')

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
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/jabref/LICENSE.md
}
