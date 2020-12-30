# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.ths.deepin
pkgver=8.90.10
pkgrel=3
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
sha512sums=('9705e570aa7429bd4f236d22759227e081cdadf18fb0c497cb1e43834aa712006457f005652139840da154ba84e162630627372d5448b9f74e489da11d328602')
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
