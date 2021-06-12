# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.jiakaobaodian.deepin
pkgver=8.2.5
pkgrel=1
epoch=
pkgdesc="Jia Kao Bao Dian (驾考宝典) Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://www.jiakaobaodian.com/"
license=('unknown')
groups=()
depends=('deepin-wine6-stable>=6.0.0.9' 'deepin-wine-helper>=5.1.23' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=wineapps.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('236282cd681d64d177eb12a0120543fcc1c335eef2677f1025a2715fa088c6fade8c2e2c0e7682e4bb1f08b4567dd6742a9a72158450a2fac89b26bbf9c50e4a')
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
