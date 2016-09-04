# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=libreoffice-extension-grammalecte-fr
pkgver=0.5.9
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
sha512sums=('8c879fe6bccae7f1c5dfeb1a1c7e7758bd13cffac9140d8a954ba533c2cc4ca0945e2c3cf5e42342e17a50495cfa86ee3e52d61e736eaa8e80d63c4eb822f237'
            '200821d8e18270b50208764e1263206d3566b1fc2ed6cf3731d308f690fac0d7333a3e06189ee011dd849a3142fe60e9c5b4a7c599351639715ea3e6df148437')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/Grammalecte-fr-v${pkgver}.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte

  # fix world writable bit
  find "${pkgdir}/usr/lib/libreoffice/share/extensions/grammalecte/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
