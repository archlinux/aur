# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=cn.feishu.deepin
pkgver=3.32.3
pkgrel=2
epoch=
pkgdesc="Fei Shu (飞书) Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://www.feishu.cn/"
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
install=feishu.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('8c68f24d8cc91e20cab625115d9cf2a62ef320fcfc76e642949fc4f3def2edb0298fca6590b9ec359b743cc374c122d87078add9c6aa3671311469f9e0950b19')
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
