# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase='percolator-bin'
pkgname=('percolator' 'percolator-converters')
pkgver=3.06.04
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
source=("percolator-v${pkgver}-linux-amd64.deb::https://github.com/percolator/percolator/releases/download/rel-${pkgver//./-}/percolator-v${_trunc_ver/./-}-linux-amd64.deb"
    "percolator-converters-v${pkgver}-linux-amd64.deb::https://github.com/percolator/percolator/releases/download/rel-${pkgver//./-}/percolator-converters-v${_trunc_ver/./-}-linux-amd64.deb")
sha256sums=('9697876d564f277463b9f24b3a5f11d34baaf95ebb2c385203bb0fc142a73f0c'
            '86d61503c69dc74c367fb53328987097d0378ef6b61494a8d0f500ac05a432ea')
package_percolator() {
	pkgdesc="Percolator and qvality, two post processors for shotgun proteomics data."
	provides=("${pkgname[0]}")
	conflicts=("${pkgname[0]}")
	ar x "${srcdir}/${pkgname[0]}-v${pkgver}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir" --exclude usr/bin/gtest_unit
}

package_percolator-converters() {
	pkgdesc="Parsers of different database search engines to percolator input format."
	provides=("${pkgname[1]}")
	conflicts=("${pkgname[1]}")
	ar x "${srcdir}/${pkgname[1]}-v${pkgver}-linux-amd64.deb"
	tar -xzf "${srcdir}/data.tar.gz" -C "$pkgdir"
}

