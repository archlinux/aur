# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.wesing.deepin
pkgver=2.21.170.0319
pkgrel=4
epoch=
pkgdesc="WeSing (全民k歌) on wine"
arch=('i686' 'x86_64')
url="https://kg.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.26' 'deepin-wine-helper>=5.1.21' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
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
sha512sums=('01cb20c78f379a8c4dbd1ac3857448a405213188d0a80cfab1174018679faa2993a8a361fd01906a92035b9f822078e4a9354471ebf5f85ec82294de028b63bb')
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
