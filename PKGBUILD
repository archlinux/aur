# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=0.4.10.3
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
sha256sums=('47dbbe0d7270d7707f276b198e8c07b1e963ccdfca15000dc3de29fd25d93c0a'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/Grammalecte-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

  # fix world writable bit
  find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
