# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=phonetisaurus-g014b2b
_cmudist=g014b2b
pkgver=0.4.0
pkgrel=1
pkgdesc="Precompiled train/test distribution for the unaccented CMUdict g014b2b distribution. Performance on this is %75.5 using the basic decoder."
arch=('any')
url="http://phonetisaurus.googlecode.com"
license=('BSD')
depends=('phonetisaurus')
makedepends=('openfst')
provides=('phonetisaurus-g014b2b')
source=("http://phonetisaurus.googlecode.com/files/${_cmudist}.tgz")
sha1sums=('d91c09a0266736e42486ec36c1bd71c431dc7d04')

build() {
	cd "${srcdir}/${_cmudist}"
	sh compile-fst.sh
}

package() {
  mkdir -p "$pkgdir/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/phonetisaurus/scripts/${_cmudist}"
  cd "${srcdir}/${_cmudist}"
  install -m644 "README.txt" "$pkgdir/usr/share/doc/${pkgname}/"
  install -m644 "${_cmudist}.arpa" \
                "${_cmudist}.corpus" \
                "${_cmudist}.fst" \
                "${_cmudist}.fst.txt" \
                "${_cmudist}.hyp" \
                "${_cmudist}.isyms" \
                "${_cmudist}.osyms" \
                "${_cmudist}.ref"  \
                "${_cmudist}.ssyms" \
                "${_cmudist}.train" \
                "${_cmudist}.words" \
                "${pkgdir}/usr/share/phonetisaurus/scripts/${_cmudist}/"
} 