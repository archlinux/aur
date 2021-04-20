# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Stas Solovey <whats_up@tut.by>
pkgname=hunspell-ru
pkgver=20200604
_commit=12e591abdbc5565e5018ed9b8fbe6d635ade87d7
pkgrel=1
pkgdesc="Russian hunspell dictionary"
arch=('any')
url='https://cgit.freedesktop.org/libreoffice/dictionaries/tree/ru_RU'
license=('LGPL3')
depends=('hunspell')
source=("${pkgname}.aff::https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/ru_RU.aff?id=${_commit}"
        "${pkgname}.dic::https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/ru_RU.dic?id=${_commit}")
sha256sums=('38ce7d4af78e211e9bafe4bf7e3d6a2c420591136cb738ec6648f8fdf6524cd7'
            '3280afe7829128ff589b2c5d8f46810ed9b0eddcc85e9b1cc3d12dc08d4c1a0b')

package() {
  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  for dict in "$pkgname".{aff,dic}; do
    install -vm644 "${dict}" "${pkgdir}/usr/share/hunspell"
    ln -sv "/usr/share/hunspell/${dict}" "${pkgdir}/usr/share/myspell/dicts"
  done
}
