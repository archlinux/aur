# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=assinador-serpro
pkgname=serpro-signer
pkgver=4.2.1
pkgrel=3
pkgdesc='Assinador Digital SERPRO : Aplicativo para geração e validação de assinaturas no padrão ICP-BRASIL'
arch=('x86_64')
url='https://www.assinadorserpro.estaleiro.serpro.gov.br/'
license=('custom')
# pkgveri686=2.7.0
depends=('libappindicator-gtk3' 'libcanberra' 'libnewt' 'xorg-xhost')
install=${pkgname}.install
# source=("https://assinadorserpro.estaleiro.serpro.gov.br/repository/AssinadorSERPROpublic.asc")
source_x86_64=("https://www.assinadorserpro.estaleiro.serpro.gov.br/repository/stable/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('a518cd18ffb7df87db2471746c5af3bac7c49cb9fe2bccd1a3de0061e7a59438')
options=('!debug')

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
