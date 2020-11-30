# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=deepin.com.qq.rtx2015
pkgver=8.3.649.1
pkgrel=2
epoch=
pkgdesc="Tencent RTX 2015 Client on Deepin-Wine5-Stable"
arch=('i686' 'x86_64')
url="https://rtx.tencent.com/rtx/index.shtml"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.9' 'deepin-wine-helper>=5.1.9' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=rtx2015.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('2c2ed3c8866e846c3218169ced183cdebbbc981683e58a9edce699d2edd6d0ad0295dc8ab7d0134ab5fa335c7ba805160f568c70c805af7c66bec32cef8a8ca0')
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
