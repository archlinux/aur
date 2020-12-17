# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.tdx.deepin
pkgver=7.52
pkgrel=1
epoch=
pkgdesc="tongdaxing on Deepin Wine5"
arch=('i686' 'x86_64')
url="https://www.tdx.com.cn/"
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
install=tongdaxing.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('8f2f0fca6fbc071cf820ae99c8164b50486bb6abc21fb520eb9ae46eb005ebe6dfc44d04b48d4bdb1dd76c30384da82c41aae4d6ee19e3bcd6a3c089eb1f79d7')
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
