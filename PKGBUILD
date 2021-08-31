# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.tencent.meeting.deepin
pkgver=2.8.7.400
pkgrel=2
epoch=
pkgdesc="Tencent Meeting Client on Deepin Wine Stable"
arch=('i686' 'x86_64')
url="https://meeting.tencent.com/"
license=('unknown')
groups=()
depends=('deepin-wine6-stable>=6.0.0.3' 'deepin-wine-helper>=5.1.19' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
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
sha512sums=('bdb0c621061b422c3f40fdbdb766734f21b67a1dd582a6298751b85d0744892db56f6eb17c4cce07020ac3e4561bff702707998068ddc838419412686a1a2e6b')
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
	sed -i "s|\$HOME/.deepinwine/deepin-wine6-stable/bin/wine|/usr/bin/deepin-wine6-stable|" run.sh
	rm wine_archive.* helper_archive.*
}
