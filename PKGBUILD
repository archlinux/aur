# Maintainer: Rafael <rafaelrc7@gmail.com>

pkgname=elgin-nfce-printer
pkgver=1.2.3
pkgrel=2
pkgdesc="Drivers for Elgin NFC-e RM22, i7, i8 and i9 printers."
arch=("x86_64" "i686")
url="https://www.elgin.com.br/Produtos/Automacao/impressorasn%C3%A3ofiscais/impressora-termica-de-cupom-i9-full"
license=("unknown")
depends=("libxcrypt-compat")
makedepends=("unrar")
install=
source=("$pkgname-$pkgver.rar::https://d2u2qhufg0q9tn.cloudfront.net/assets/arquivos/imgCard_4ce638a5-22e5-4a0d-a820-0108152ced91_imgCard_3969ab8d-70ab-4b53-ac90-d84cc55ddd70_Elgin_i9_Linux_Driver_v1.2.3Linux.rar")
noextract=("$pkgname-$pkgver.rar")
sha256sums=("37ed5a41f92ce5f70f0d534a1bd0d31450ad2c8dc33331535d4434428b587625")

prepare() {
	unrar x -ad -y "./$pkgname-$pkgver.rar"
}

package() {
	cd "$pkgname-$pkgver/Elgin_i9_linux_driver_v1.2.3/setup"

	_FILTERDIR="${pkgdir}/usr/lib/cups/filter/"
	_PPDDIR="${pkgdir}/usr/share/ppd/elgin-nfce-printer/"

	case $CARCH in
		i686)   _RASTERTOHPRT="./x86/rastertohprt" ;;
		x86_64) _RASTERTOHPRT="./x64/rastertohprt" ;;
	esac

	install -Dm755 "${_RASTERTOHPRT}" "${_FILTERDIR}/rastertohprt"
	install -d "${_PPDDIR}"
	install -Dm644 ../ppd/*.ppd  "${_PPDDIR}"
}

