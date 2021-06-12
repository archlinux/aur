# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.cbox.deepin
pkgver=4.6.7.2
pkgrel=1
epoch=
pkgdesc="CBox (央视影音) on Deepin Wine6"
arch=('i686' 'x86_64')
url="http://cbox.cntv.cn/"
license=('unknown')
groups=()
depends=('deepin-wine6-stable>=6.0.0.7' 'deepin-wine-helper>=5.1.15' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
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
sha512sums=('b4c3c3a93c9bce5cc4e31909ad8e5ceb430808141919980698790de6a95f3d742f865aceaccbf8337e8c6101dec4c3d8c449b9dc6b7d35b821d31cf6384f2043')
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
