# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.wymail.deepin
pkgver=4.15.6.1016
pkgrel=3
epoch=
pkgdesc="Wymail (网易邮箱) Client on Deepin Wine6"
arch=('i686' 'x86_64')
url="https://mail.163.com/"
license=('unknown')
groups=()
depends=('deepin-wine6-stable>=6.0.0.8' 'deepin-wine-helper>=5.1.22' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
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
sha512sums=('ed77ff6d82524eaf207355e5c962cbc8e1bd6279d2e9c3b337d71e38692a79eb10aaad61f85d7a4332eb21da17a7390bbcb7a4c98a2062ffd5326a4c57625635')
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
