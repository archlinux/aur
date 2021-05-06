# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Stas Solovey <whats_up@tut.by>
pkgname=hunspell-ru
pkgver=20200604
_commit=12e591abdbc5565e5018ed9b8fbe6d635ade87d7
pkgrel=3
pkgdesc="Russian hunspell dictionary"
arch=('any')
url='https://cgit.freedesktop.org/libreoffice/dictionaries/tree/ru_RU'
license=('custom')
depends=('hunspell')
source=("${pkgname}.aff::https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/ru_RU.aff?id=${_commit}"
        "${pkgname}.dic::https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/ru_RU.dic?id=${_commit}"
        "${pkgname}-README.txt::https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/README_ru_RU.txt?id=${_commit}")
sha256sums=('38ce7d4af78e211e9bafe4bf7e3d6a2c420591136cb738ec6648f8fdf6524cd7'
            '3280afe7829128ff589b2c5d8f46810ed9b0eddcc85e9b1cc3d12dc08d4c1a0b'
            '262af2f6ad70a61e5ee1332ff44fa8ee50edca819cf33207d8ad6ba6a0c9be52')

package() {
  install -Dm644 "${pkgname}-README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/README.txt"
  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  for dict in aff dic; do
    install -Dm644 "${pkgname}.${dict}" "${pkgdir}/usr/share/hunspell/ru_RU.${dict}"
    ln -Ts "/usr/share/hunspell/ru_RU.${dict}" "${pkgdir}/usr/share/myspell/dicts/ru_RU.${dict}"
  done
}
