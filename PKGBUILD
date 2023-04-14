# Maintainer: Igor Deyashkin <ovsyanka42@gmail.com>

# I am using hunspell-ru package as an example

pkgname=hunspell-multilingual-ru-en
# This is the version on the extension. Files in the repo and in the extension match together.
pkgver=1.0.3.1webext
_commit=607c1f0b7e8fa0c0e917aad1a85a381fabcae440
pkgrel=0
pkgdesc="English + Russian bilingual Hunspell dictionary."
arch=('any')
url='https://addons.mozilla.org/ru/firefox/addon/unified-russian-english-spell/'
license=('LGPL3')
optdepends=('hunspell: the spell checking libraries and apps')
source=("${pkgname}-${pkgver}.aff::https://github.com/titoBouzout/Dictionaries/raw/${_commit}/Russian-English%20Bilingual.aff"
        "${pkgname}-${pkgver}.dic::https://github.com/titoBouzout/Dictionaries/raw/${_commit}/Russian-English%20Bilingual.dic"
        "${pkgname}-${pkgver}-README.txt::https://github.com/titoBouzout/Dictionaries/raw/${_commit}/Russian-English%20Bilingual.txt")
sha256sums=('66b8af900983e354f5561a5f2b97ac3ca21128587b9164cc5651901a10981186'
            '1972265aeb45860e0b96ae838ba4498425041aa18a82117c818ceae80d9ba20b'
            '417ebf6adf8b10974f3c354c9637c10b5893d3a9c22960e52052cabcc2648dbf')

package() {
	install -vdm755 "${pkgdir}/usr/share/hunspell"
	for dict in aff dic; do
		install -vDm644 "${pkgname}-${pkgver}.${dict}" "${pkgdir}/usr/share/hunspell/ru-en.${dict}"
	done

	# the symlinks
	install -dm755 "$pkgdir"/usr/share/myspell/dicts
	pushd "$pkgdir"/usr/share/myspell/dicts
	for file in "$pkgdir"/usr/share/hunspell/*; do
		ln -sv /usr/share/hunspell/$(basename $file) .
	done
	popd
    # I am not sure it is correct location, just placing like in hunspell-ru package
	install -vDm644 "${pkgname}-${pkgver}-README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/README.txt"
}
