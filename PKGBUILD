# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.dzh365.deepin
pkgver=8.31.00.18788.47
pkgrel=0
epoch=
pkgdesc="dzh365 Client on Deepin Wine5"
arch=('i686' 'x86_64')
url="http://www.gw.com.cn/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.15' 'deepin-wine-helper' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=dzh365.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('2a1ceb07a2db90d679646d54399852b524769d497dd53558d4bc5c5dae04ce4e399c400eaa26363fdb449859cc831b00bf4c180c11ede39a0f7a499427142658')
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
