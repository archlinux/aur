# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.eastmoney.emdesk.deepin
pkgver=9.4.0.9142
pkgrel=3
epoch=
pkgdesc="EastMoney Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://www.eastmoney.com/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.16' 'deepin-wine-helper' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=eastmoney.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('81c812d0321e7a5e8026f4cb204c726132b1ed4cf1cbe5d2b32319bc81dfc80cd9b0c2addab56308f2fde2393d4d30664c49192bc5229721a0a72a6c8e5875c9')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	rmdir opt/apps/${pkgname}/entries
	cd opt/apps/${pkgname}/files
	sed -i "/extract_archive \"/d" run.sh
	sed -i "s|\$HOME/.deepinwine/deepin-wine-helper|/opt/deepinwine/tools|" run.sh
	sed -i "s|\$HOME/.deepinwine|/usr/lib|" run.sh
	rm wine_archive.* helper_archive.*
}
