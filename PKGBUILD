# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=5.7_5.3.14
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
sha256sums=('a9a03853ad075f30bbbd1d16a0a35cbd8c7a9ac9b3720ffef3eece08732315d9')
build() {
	bsdtar -xf "${srcdir}/data."*
	sed -i 's/"$(arch)"/`uname -m`/g' "${srcdir}/opt/apps/store.spark-app.${pkgname}/files/deepinwine/tools/spark_run_v4.sh"
	sed -i "27d" "${srcdir}/opt/apps/store.spark-app.${pkgname}/files/deepinwine/tools/${pkgname}/deepin-wine8-stable-wrapper/deepin-wine8-stable"
	sed -i "27i\if command -v spark-box64 2>/dev/null ;then" "${srcdir}/opt/apps/store.spark-app.${pkgname}/files/deepinwine/tools/${pkgname}/deepin-wine8-stable-wrapper/deepin-wine8-stable"
}
package() {
	cp -r "${srcdir}/opt" "${pkgdir}"
	install -Dm755 -d "${pkgdir}/opt/deepinwine/tools"
	ln -sf "/opt/apps/store.spark-app.${pkgname}/files/deepinwine/tools/spark_run_v4.sh" "${pkgdir}/opt/deepinwine/tools/spark_run_v4.sh"
}