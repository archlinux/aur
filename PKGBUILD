# Maintainer: Raffaele Mancuso <raffaelemancuso532@gmail.com>
_lang=pt
_langfull=Portuguese
pkgname="stardict-bobotig-${_lang}"
pkgver=2023_10_20
pkgrel=1
pkgdesc="${_langfull} monolingual dictionary, based on Wiktionary, StarDict file format, BoboTiG's daily dumps"
arch=("any")
url="https://github.com/BoboTiG/ebook-reader-dict"
license=('cc-by-sa-3.0')
source=("https://github.com/BoboTiG/ebook-reader-dict/releases/download/${_lang}/dict-${_lang}-${_lang}.zip"{,.sha256})
b2sums=("SKIP"
	"SKIP")

pkgver() {
	sed -n 's/^date=//p' dict-data.ifo | sed 's/-/_/g'
}

package() {
	sha256sum --strict --check "dict-${_lang}-${_lang}.zip.sha256"
	if [ "$?" -ne 0 ]; then
		echo "Checksum is wrong. Aborting"
		exit
	else
		echo "Checksum OK"
	fi
	install -Dm644 dict-data.dict.dz dict-data.idx dict-data.ifo -t "${pkgdir}/usr/share/stardict/dic/bobotig-${_lang}"
	if [ -f dict-data.syn ]; then
		install -Dm644 dict-data.syn -t "${pkgdir}/usr/share/stardict/dic/bobotig-${_lang}"
	fi
	if [ -d ./res ]; then
		install -Dm644 ./res/* -t "${pkgdir}/usr/share/stardict/dic/bobotig-${_lang}/res"
	fi
}
