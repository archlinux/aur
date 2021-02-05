# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.pscs6.deepin
pkgver=13.0
pkgrel=4
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
sha512sums=('4ddf7aba470d7133fcfc0e8ac9e089ffb52f00aee3d2981d5d896f23c83eb3e0a54f441a8a057f185c6732cfbfe83ffa632b7bbaa05a7bebb11959ecbc31be74')
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
