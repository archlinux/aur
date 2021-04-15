# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.tdx.deepin
pkgver=7.52
pkgrel=2
epoch=
pkgdesc="tongdaxing on Deepin Wine5"
arch=('i686' 'x86_64')
url="https://www.tdx.com.cn/"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.19' 'deepin-wine-helper>=5.1.16' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=tongdaxing.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('edfba8755aa45e42df63276c95ee79fcbd72ec70ee2c811841e8b7383f0d70369755d3ca3a9ba091a6e59dbed44f35dc41625eb511b2f7e4c3c46df6b7367281')
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
