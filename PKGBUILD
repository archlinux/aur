# Contributer: abcfy2 <abcfy2@163.com>
pkgname='deepin-wine5-helper'
pkgver=5.1.15
pkgrel=1
pkgdesc="Deepin Wine5 helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
depends=('deepin-wine5-stable')
provides=("deepin-wine-helper=$pkgver")
conflicts=("deepin-wine-helper")
makedepends=('tar' 'p7zip')
source=(
    "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.xmly.deepin/com.xmly.deepin_1.3.3deepin4_i386.deb"
)
sha256sums=('74be41d9ac57c7057a4495eafa5aa0fcb77e6ad73e039703d41ee809e797e97a')

package() {
	cd ${srcdir}
	tar xpvf data.tar.xz --xattrs-include='*' --numeric-owner
	install -d ${pkgdir}/opt/deepinwine/tools
    7z x -o${pkgdir}/opt/deepinwine/tools opt/apps/com.xmly.deepin/files/helper_archive.7z
	cd ${pkgdir}/opt/deepinwine/tools
	sed -i "s/rm c: z: y:/rm c:/g" run_v3.sh
	sed -i "/ln -s -f \/ z:/d" run_v3.sh
	sed -i "/ln -s -f \$HOME y:/d" run_v3.sh
}
