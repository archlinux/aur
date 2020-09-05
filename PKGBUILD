# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=multiwfn
_PkgName=Multiwfn
pkgver=3.7
pkgrel=1
pkgdesc="A program for realizing electronic wavefunction analysis"
arch=("x86_64")
url="http://sobereva.com/multiwfn"
license=('custom')
depends=('openmotif' 'libglvnd')
makedepends=('intel-fortran-compiler' 'intel-mkl-static')
conflicts=("$pkgname-bin")
source=("${url}/misc/${_PkgName}_${pkgver}_src_Linux.zip")
sha256sums=('9805e4fa845b6efb8540533af0d0dc212e17bb579706a5ad6639b25a01d85f58')

prepare() {
  cd "${srcdir}/${_PkgName}_${pkgver}_src_Linux"
  sed -i 's@-msse3@-xHost@' Makefile
  sed -i 's@libreta_slow@libreta_fast@' Makefile
}

build() {
  cd "${srcdir}/${_PkgName}_${pkgver}_src_Linux"
  make
}

package() {
  cd "$pkgdir"
  install -dm755 usr/{bin,share/licenses/$pkgname}
  cd "${srcdir}/${_PkgName}_${pkgver}_src_Linux"
  install -m755 $_PkgName "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
LICENSE INFORMATION: To download and use Multiwfn, you are required to read and agree the following terms:
(a) Currently Multiwfn is free of charge and open-source for both academic and commerical usages, anyone is allowed to freely distribute the original or their modified Multiwfn codes to others.
(b) Multiwfn can be distributed as a free component of commercial code. Selling modified version of Multiwfn may also be granted, however, obtaining prior consent from the original author of Multiwfn (Tian Lu) is needed.
(c) If Multiwfn is utilized in your work, or your own code incorporated any part of Multiwfn code, at least the original paper of Multiwfn MUST BE cited in your work or code:
Tian Lu, Feiwu Chen, J. Comput. Chem., 33, 580-592 (2012).
(d) There is no warranty of correctness of the results produced by Multiwfn, the author of Multiwfn does not hold responsibility in any way for any consequences arising from the use of the Multiwfn.
EOF
}
