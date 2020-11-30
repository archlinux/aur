# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.qq.video.deepin
pkgver=11.2.7044.0
pkgrel=1
epoch=
pkgdesc="Tencent Video Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://v.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.10' 'deepin-wine-helper>=5.1.10' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=qqvideo.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('877c68b1893847d7ea5cf1f5f1b61d5cb01f7b5aad00e229758190061d34f28d7193d7e68780e42e7d58d33ce11170e116f38731bade0e3377d7559921654eca')
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
