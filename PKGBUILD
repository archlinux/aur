# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.foxmail.deepin
pkgver=7.2
pkgrel=5
epoch=
pkgdesc="Tencent Foxmail Client on Deepin Wine5"
arch=('i686' 'x86_64')
url="https://www.foxmail.com/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.7' 'deepin-wine-helper>=5.1.8' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=foxmail.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('a663bb259583d7e1006a948c50fbc768a226568f0f74c3ae13a4afdae76f93fb4aedf6c423c4acb7021ae010c5e8d2dd0e14fe3e4c017ff6abb38e30bdc4d8f5')
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
