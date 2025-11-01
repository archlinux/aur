# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=assinador-serpro
pkgname=serpro-signer
pkgver=4.3.2
pkgrel=1
pkgdesc='Assinador Digital SERPRO : Aplicativo para geração e validação de assinaturas no padrão ICP-BRASIL'
arch=('x86_64')
url='https://www.assinadorserpro.estaleiro.serpro.gov.br/'
license=('custom')
depends=('libappindicator-gtk3' 'libcanberra' 'libnewt' 'xorg-xhost')
install=${pkgname}.install
source=("https://www.assinadorserpro.estaleiro.serpro.gov.br/downloads/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('0fc4b76549bf82281c43de443a3beefef7059d853b2b1846a410eb543488fe0c')
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
