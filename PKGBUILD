# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.tencent.meeting.deepin
pkgver=2.2.0.409
pkgrel=2
epoch=
pkgdesc="Tencent Meeting Client on Deepin Wine5 Stable"
arch=('i686' 'x86_64')
url="https://meeting.tencent.com/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.15' 'deepin-wine-helper>=5.1.13' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=meeting.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('b8caabf9a7345bd2b631e53395222a7b165e416e97b8aa4912fefac17612d6a4a12ee66ae0fdecc05588fbdcae3ff5d92431d2627bfb01690e0fbb1392a07f8e')
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
