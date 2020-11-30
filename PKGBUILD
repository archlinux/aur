# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.taobao.aliclient.qianniu.deepin
pkgver=7.22.06N
pkgrel=11
epoch=
pkgdesc="Ali Qian Niu Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://cts.alibaba.com/product/qianniu.htm"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.10' 'deepin-wine-helper>=5.1.10' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=qianniu.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('a0168d694035250879a529e2b5fc9550c726af2a19e610c5ae9524aa52184263769eecc8eacfd5fc3fc39b9aa4a27be10eeddb663c1bb793fd01bf487649bb7d')
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
