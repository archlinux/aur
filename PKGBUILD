# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.qq.video.deepin
pkgver=11.2.7044.0
pkgrel=2
epoch=
pkgdesc="Tencent Video Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://v.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine6-stable>=6.0.0.1' 'deepin-wine-helper>=5.1.16' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
replaces=()
backup=()
options=()
install=qqvideo.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('29350a62b153732550f21646dbfcc35c88dab8f73ba8408e272f81c0be4ff86bca14f6d155e264657b7905d737770846bd06c0b8cd7e9b5633c6303519622693')
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
