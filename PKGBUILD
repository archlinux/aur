# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.freepiano.deepin
pkgver=2.2.2.1
pkgrel=2
epoch=
pkgdesc="freepiano on deepin-wine5-stable"
arch=('i686' 'x86_64')
url="https://freepiano.tiwb.com/"
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
install=freepiano.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('7fd127770897eb6595396d3efcb3f263d5ac3b1ccc4e2fdcb283966a9aaa66fe41c30a5b8f4c605461a627c73d43267ee6e8e10c8ffb23bc33fbc28ef54689ef')
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
