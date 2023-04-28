# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=spread3
_pkgname=SpreaD3
_pkg=spreaD3
pkgver=0.9.5
epoch=1
_pkgver=${pkgver//./-}
pkgrel=1
depends=('java-runtime=8')
makedepends=('java-environment=8' 'ant')
pkgdesc="a user-friendly application to analyze and visualize pathogen phylodynamic reconstructions resulting from Bayesian inference of sequence and trait evolutionary processes. https://doi.org/10.1093/molbev/msw082"
arch=('x86_64')
url="https://rega.kuleuven.be/cev/ecv/software/SpreaD3"
license=('LGPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/phylogeography/SpreaD3/archive/refs/tags/${pkgver}.tar.gz"
	"${pkgname}.desktop"
	"${pkgname}1.patch::https://github.com/phylogeography/SpreaD3/commit/d63d294ad9c1f82e8883bbd602d298df0c045bf0.patch"
	"${pkgname}2.patch::https://github.com/phylogeography/SpreaD3/commit/d297ed31e360597b95da5c790d2402a1782109f8.patch"
	"https://raw.githubusercontent.com/phylogeography/SpreaD3/d297ed31e360597b95da5c790d2402a1782109f8/lib/corba-api-5.0.1.jar")
sha256sums=('41b9c1a9b9919fed07e4ba82d0b36eafaaf5608059cb1a97413a990660b01685'
            'c2d59b208dc6c334ea67ac8d557350c6e41a6d8d3b10d912ac402b7d1c2229d1'
            'b95b03fc8a8e8d1c5dbad7b735ee5635c3ebb1c61d4a116ed5fcede3e71541e2'
            'fc50c911cd84df943d634afca9d3b16e338b1540127c16d0b94280a1a874b63d'
            '6bcf3bb9c768d4412c88ebb659a0c6403fd7fe2052fada8b1324eee93abc2bfd')
prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 < $srcdir/${pkgname}1.patch
  patch -p1 < $srcdir/${pkgname}2.patch
  cp $srcdir/corba-api-5.0.1.jar $srcdir/$_pkgname-$pkgver/lib/
}
build(){
  cd $srcdir/$_pkgname-$pkgver
  ant jar
}
package() {
    install -dm755 "$pkgdir"/usr/share/{applications,${pkgname}}
    install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    install -m 755 ${srcdir}/$_pkgname-$pkgver/classes/gui/icons/spread.png ${pkgdir}/usr/share/${pkgname}
    install -m 755 ${srcdir}/${_pkgname}-${pkgver}/dist/${_pkg}_v$pkgver.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
}
