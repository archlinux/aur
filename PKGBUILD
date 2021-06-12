# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.jisuoffice.deepin
pkgver=1.0.1.36093
pkgrel=4
epoch=
pkgdesc="jisuOffice (极速 Office) on wine"
arch=('i686' 'x86_64')
url="https://jisuoffice.com/"
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
sha512sums=('78bdc5211143df1cc484595aca375b3f5c9c619da06555a31b405241b92045751c04bdc8d0e4226bbbd3e0ffe60ad0dd235dc399e5c63c3710568477ae0ba1d1')
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
