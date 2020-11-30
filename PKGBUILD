# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.meituxiuxiu.deepin
pkgver=6.0.3.3
pkgrel=5
epoch=
pkgdesc="Meitu Xiu Xiu Client on Deepin-Wine5-Stable"
arch=('i686' 'x86_64')
url="https://xiuxiu.web.meitu.com/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.10' 'deepin-wine-helper>=5.1.12' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=mtxx.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('6032aa254be2978f59215a0255f7814e477db483dc9d9b374e6f537ed34b5e82a32d230cf32a6af57391b729845b960b55924c4f3f8c85bdcb3284a762be8800')
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
