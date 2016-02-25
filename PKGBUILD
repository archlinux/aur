# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=0.4.10.6
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
source=("http://www.dicollecte.org/grammalecte/oxt/Grammalecte-v${pkgver}.oxt"
	      "LICENSE::https://www.mozilla.org/MPL/2.0/index.txt")
noextract=(Grammalecte-v${pkgver}.oxt)
sha256sums=('05b38afd2425a17f8dfdcf94925d53b083b02f03c1cade280f8c27444ecd0540'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/Grammalecte-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

  # fix world writable bit
  find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
