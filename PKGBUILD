# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=assinador-serpro
pkgname=serpro-signer
pkgver=4.0.2
pkgrel=2
pkgdesc='Assinador SERPRO'
arch=('x86_64')
url='https://www.assinadorserpro.estaleiro.serpro.gov.br/'
# pkgveri686=2.7.0
depends=('libappindicator-gtk3' 'libcanberra' 'libnewt')
install=${pkgname}.install
# source=("https://assinadorserpro.estaleiro.serpro.gov.br/repository/AssinadorSERPROpublic.asc")
# source_i686=("https://www.assinadorserpro.estaleiro.serpro.gov.br/repository/stable/assinador-serpro-i386_${pkgveri686}_i386.deb")
source_x86_64=("https://www.assinadorserpro.estaleiro.serpro.gov.br/repository/stable/${_pkgname}_${pkgver}_amd64.deb")
# sha256sums_i686=('7ec54364cd5ad1887dad9702ef1de663d3beac3d4ddcac5adb38fc32c8921683')
sha256sums_x86_64=('dfee252bba588ac16443b2618ab64c32474d1dd23321ae0848f0c3f9ba729ae2')

prepare() {
	[ -d data ] && rm -rf data
	mkdir data
	cd data
	for datatar in ../data.tar.*; do
		msg2 "Unpacking $datatar"
		tar -xf $datatar
	done
}

package() {
	cp -dr --no-preserve=ownership ./data/{etc,opt,usr} "${pkgdir}"/
}
