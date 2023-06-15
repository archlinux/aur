# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase='percolator-bin'
pkgname=('percolator' 'percolator-converters')
pkgver=3.06.01
pkgrel=1
epoch=
pkgdesc="Software for postprocessing of shotgun proteomics data + format converters + Elude tool"
arch=('x86_64')
url="http://percolator.ms/"
license=('Apache')
depends=('gcc-libs' 'tokyocabinet')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
_trunc_ver=${pkgver%.*}
source=("https://github.com/percolator/percolator/releases/download/rel-${pkgver//./-}/percolator-v${_trunc_ver/./-}-linux-amd64.deb"
    "https://github.com/percolator/percolator/releases/download/rel-${pkgver//./-}/percolator-converters-v${_trunc_ver/./-}-linux-amd64.deb")
sha256sums=('d147aead6b9aab702592f16572847fbdf0e643647af4c0ba46260ce86dcfa1dd'
            '12f0dd2df9ea00417e45bb03c643f9f4f7cc10a50c9ba88b4405d44ae2c210c4')
package_percolator() {
	pkgdesc="Percolator and qvality, two post processors for shotgun proteomics data."
	provides=("${pkgname[0]}")
	conflicts=("${pkgname[0]}")
	ar x "${srcdir}/${pkgname[0]}-v${_trunc_ver//./-}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir" --exclude usr/bin/gtest_unit
}

package_percolator-converters() {
	pkgdesc="Parsers of different database search engines to percolator input format."
	provides=("${pkgname[1]}")
	conflicts=("${pkgname[1]}")
	ar x "${srcdir}/${pkgname[1]}-v${_trunc_ver//./-}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

