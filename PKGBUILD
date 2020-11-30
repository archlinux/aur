# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.youdao.note.deepin
pkgver=6.10.1.0
pkgrel=2
epoch=
pkgdesc="YouDao Note Client on Deepin Wine5"
arch=('i686' 'x86_64')
url="http://note.youdao.com/"
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
install=ynote.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('7f71d4a0f7093ffceee835ba205ba60559b04c291bb8a0d6aea9b61f31ae741c47e84d8ad06acd4de2b3995d4e52eaebbab328a2026501a94753913ad67171ea')
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
