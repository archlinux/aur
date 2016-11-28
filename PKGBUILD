# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=0.5.13.1
pkgrel=1
pkgdesc="French grammar checker extension for LibreOffice."
arch=('any')
url="http://www.dicollecte.org/grammalecte/"
license=('GPL3' 'custom:MPL2' 'LGPL')
depends=('libreoffice')
groups=('libreoffice-extensions')
conflicts=('libreoffice-extension-languagetool')
provides=('libreoffice-extension-dictionaries-fr')
makedepends=('unzip')
changelog=changelog
source=("http://www.dicollecte.org/grammalecte/oxt/Grammalecte-fr-v${pkgver}.oxt"
	      "LICENSE::https://www.mozilla.org/MPL/2.0/index.txt")
noextract=(Grammalecte-fr-v${pkgver}.oxt)
sha512sums=('6e57920b1198bd62ba5bf522bdceadf285394df993a9c77f2558e6d48f80dd835417da0cb6d1849fd987b382932dbdf0dd1a70da1043cdddccf13e073e8edc09'
            '200821d8e18270b50208764e1263206d3566b1fc2ed6cf3731d308f690fac0d7333a3e06189ee011dd849a3142fe60e9c5b4a7c599351639715ea3e6df148437')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

  # fix world writable bit
  find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
