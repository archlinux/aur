# Contributer: stevnev <stevenv.w.w@gmail.com>
pkgname=com.fenbi.deepin
pkgver=4.0.0.1295
pkgrel=4
epoch=
pkgdesc="Fenbi on Deepin Wine"
arch=('i686' 'x86_64')
url="https://fenbi.com/"
license=('unknown')
groups=()
depends=('deepin-wine6-stable>=6.0.0.1' 'deepin-wine-helper>=5.1.16' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('3e1b5a7bbbd7785225d5ec4bde7853e9b799d5c0e6876285ec5cc05829c3fac5edb75ecda783a3a3aad950adb298c50a85c3a0f895baa9b49b714d14eca77404')
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
