# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.pscs6.deepin
pkgver=13.0
pkgrel=3
epoch=
pkgdesc="Photoshop CS 6 on Deepin Wine5"
arch=('i686' 'x86_64')
url="https://www.adobe.com/products/photoshop.html"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.19' 'deepin-wine-helper>=5.1.16' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=pscs6.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('7fac787a2e15c9b39d8727d7d0e77584c726a63a299f2698530f45ba5701f1c9a4e306615e0a162a6ce4a7be289e7b003ce0818b6f0af7ea9b97675d8ac140ab')
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
