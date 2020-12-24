# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.ths.deepin
pkgver=8.90.10
pkgrel=2
epoch=
pkgdesc="Tong Hua Shun (同花顺) Client on Deepin Wine"
arch=('i686' 'x86_64')
url="http://www.10jqka.com.cn/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.17' 'deepin-wine-helper>=5.1.15' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=ths.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('17db28d191279b7711c1e738a6215fb45c2afeb6acda3445e94459e973aca06a4c45b0510c1a7a96971fbbb3c90168c2c3d5ef600d766d1f93d3694e70a04c5f')
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
