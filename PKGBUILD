# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=0.5.8
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
sha512sums=('10e6b59321076ce9cba7495a32db03afb7f8a1f2da2f2f58a73d1c9cca533fe340673e19947163225b6d4483b281f0897d27ccf44f423794b750bca21459e3f8'
            '200821d8e18270b50208764e1263206d3566b1fc2ed6cf3731d308f690fac0d7333a3e06189ee011dd849a3142fe60e9c5b4a7c599351639715ea3e6df148437')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

  # fix world writable bit
  find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
