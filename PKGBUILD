# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgbase=pythia
pkgmajor=6
pkgname=${pkgbase}${pkgmajor}
pkgver=4.28
pkgrel=2
pkgdesc="The Lund Monte Carlo"
arch=('x86_64')
url="http://pythia6.hepforge.org"
license=('unknown')
groups=()
makedepends=('gcc-fortran')
depends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('emptydirs' 'strip' 'staticlibs' 'libtool')
install=
changelog=
source=("https://root.cern.ch/download/${pkgname}.tar.gz"
	"http://www.hepforge.org/archive/${pkgname}/${pkgbase}-${pkgmajor}.${pkgver}.f.gz")
noextract=()
md5sums=('c88014d8380a77c81556d3887dc0b739'
         'c90168f925fc6677fa56c6535be5d9c1')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

prepare() {
	cd "${pkgname}"
	rm ${pkgname}*.f
	mv ../*.f.gz .
	gunzip ${pkgbase}-${pkgmajor}.${pkgver}.f.gz
}

build() {
	cd "${pkgname}"
	./makePythia6.linuxx8664
}

package() {
	cd "${pkgname}"

	installdir=${pkgdir}/usr/lib
	mkdir -p ${installdir}
	cp -r libPythia6.so ${installdir}
	ln -s libPythia6.so ${installdir}/libpythia6.so
}
