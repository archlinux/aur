# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase='percolator-bin'
pkgname=('percolator' 'percolator-converters')
pkgver=3.06.05
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
sha256sums=('4e742c0bc6811b3359ca25c1025ba8e0bfe5908e5a5aa88869a0a7d966922ce1'
            '6290901d0ab703cc2b5f5839257c5a3ec43e6245dd39841ffe9751978eb667b7')
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

