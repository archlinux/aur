# Contributer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.taobao.wangwang.deepin
pkgver=9.12.10C
pkgrel=6
epoch=
pkgdesc="Ali WangWang Client on Deepin Wine5"
arch=('i686' 'x86_64')
url="https://alimarket.taobao.com/markets/qnww/portal-group/ww/index"
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
install=wangwang.install
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}deepin${pkgrel}_i386.deb")
sha512sums=('f9330ea8625384ecee28625f4e7b5a1cb827ac1c512d0be002a9cd4fdbc97c452d4fdfe7f43cfb09a6072dfb19bb1a62fe7fddee5fe5066d1c00756c1871c209')
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
	sed -i "s|\$HOME/.deepinwine/deepin-wine5-stable/bin/wine|/usr/bin/deepin-wine5-stable|" run.sh
	rm wine_archive.* helper_archive.*
}
