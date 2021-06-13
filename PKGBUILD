# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.zybstudent.xp.deepin
pkgver=3.7.0
pkgrel=1
epoch=
pkgdesc="ZYBStudent-XP (作业帮直播课) Client on Deepin Wine5"
arch=('i686' 'x86_64')
url="https://zhibo.zuoyebang.com/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.25' 'deepin-wine-helper>=5.1.20' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
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
sha512sums=('ffd1af20c3ffe502d6eb938480f17bf02db31d25579227aae0034144e8af9340519febe5f5f574ed82f913121509c94730587557fb6ad416aa3486f55db92ef8')
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
