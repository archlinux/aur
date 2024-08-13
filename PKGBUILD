# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=5.6.4.4_5.3.14
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/spark-store-project/spark-wine"
license=('GPL-3.0-only')
depends=(
	'zenity'
	'p7zip'
	'deepin-wine-helper'
	'python-dbus'
)
optdepends=('noto-fonts-cjk: recommended fonts')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver//_/-}/${pkgname}_${pkgver//_/-}_all.deb")
sha256sums=('f22c9ffcd1a38b77ef80888ad5e6664ce6797b6a9983668f8393e0d306134bd7')
build() {
	bsdtar -xf "${srcdir}/data."*
	sed "27d" -i "${srcdir}/opt/apps/store.spark-app.${pkgname}/files/deepinwine/tools/${pkgname}/deepin-wine8-stable-wrapper/deepin-wine8-stable"
	sed "27i\if command -v spark-box64 2>/dev/null ;then" -i "${srcdir}/opt/apps/store.spark-app.${pkgname}/files/deepinwine/tools/${pkgname}/deepin-wine8-stable-wrapper/deepin-wine8-stable"
}
package() {
	cp -r "${srcdir}/"{opt,usr} "${pkgdir}"
}