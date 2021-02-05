# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.youku.deepin
pkgver=8.0.7.11061
pkgrel=2
epoch=
pkgdesc="YouKu (优酷) Client on Deepin Wine5"
arch=('i686' 'x86_64')
url="https://www.youku.com"
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
install=youku.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('00e577ab34fe3999094fb0172c17c87001d8b65b9069a28c3f891e6571c49830c29790237f0ee1692666f62ea0ca584be3f0595a4b84e2ff5be43b7d9f125b5a')
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
