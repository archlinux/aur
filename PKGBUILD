# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.evernote.deepin
pkgver=6.21.10
pkgrel=2
epoch=
pkgdesc="Evernote Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://evernote.com"
license=('unknown')
groups=()
depends=('deepin-wine5-stable>=5.0.0.12' 'deepin-wine-helper>=5.1.12' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=evernote.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('138e850eb36255614d35d51b0e90a015a351bd1e1fb79a260b6a9ce9f7659df0a6a1ba0036346073e06ec0c840f30ce2956eb93073f7962801779732d71f6fd7')
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
