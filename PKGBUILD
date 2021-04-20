# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=hyphen-ru
pkgver=20200604
_commit=12e591abdbc5565e5018ed9b8fbe6d635ade87d7
pkgrel=1
pkgdesc="Russian hyphenation rules"
arch=('any')
url='https://cgit.freedesktop.org/libreoffice/dictionaries/tree/ru_RU'
license=('custom')
depends=('hyphen')
source=("${pkgname}.dic::https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/hyph_ru_RU.dic?id=${_commit}"
        "${pkgname}-README.txt::https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/README_ru_RU.txt?id=${_commit}")
sha256sums=('e9a6ae92765fc7e63d879f2ccf3f50f2b95bc8ed7618a6f31c34ce7d39844c83'
            '262af2f6ad70a61e5ee1332ff44fa8ee50edca819cf33207d8ad6ba6a0c9be52')

package() {
  cd "$srcdir"
  install -Dm644 "${pkgname}-README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/README.txt"
  install -dm755 "${pkgdir}/usr/share/hyphen"
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  for dict in "${pkgname}.dic"; do
    install -Dm644 "${dict}" "${pkgdir}/usr/share/hyphen"
    ln -sT "/usr/share/hyphen/${dict}" "${pkgdir}/usr/share/myspell/dicts/${dict}"
  done
}
