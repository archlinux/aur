# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.qq.tim.spark
pkgver=3.3.9.22051spark1
pkgrel=2
epoch=
pkgdesc="Tencent TIM Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="https://tim.qq.com/"
license=('unknown')
groups=()
depends=(
	'deepin-wine5'
	'spark-dwine-helper'
)
checkdepends=()
optdepends=()
provides=()
conflicts=('com.qq.tim.dcs')
replaces=()
backup=()
options=()
# install=tim.install
changelog=
source=(
	"https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb"
	"reg.patch"
)
sha512sums=(
	'bb4ccf58f074c893a97a9d92ab9e378e5045d761e706ec072731ffa379aa32b35c278acf8c01f51515dae82fafb3d8d43e64afb436d276e60f3c6ebad91d26a3'
	'5730066dc9bf3689e3db1c08ba83b516efc0bcc7fe6ff47198b43dd352718a6942d01190da87fe010816bf1e9e0e453a09fd15314e4004c309e7f52725b32528'
)
validpgpkeys=()

prepare() {
	_bottle_archive="${srcdir}/dpkgdir/opt/apps/com.qq.tim.spark/files/files.7z"
	mkdir -p "${srcdir}/dpkgdir"
	tar -xpvf data.tar.xz -C "${srcdir}/dpkgdir"
	7z x $_bottle_archive user.reg -o"${srcdir}/"
	patch -p1 -d "${srcdir}/" < "${srcdir}/reg.patch"
	7z a $_bottle_archive "${srcdir}/user.reg"

	cd "${srcdir}/dpkgdir"
    sed -i 's/TIM.exe/tim.exe/' usr/share/applications/com.qq.tim.spark.desktop
	sed -i 's|START_SHELL_PATH=.*|START_SHELL_PATH="/opt/deepinwine/tools/spark_run_v4.sh"|' opt/apps/${pkgname}/files/run.sh
	rm -rf opt/apps/${pkgname}/{entries/,info}
}

package() {
	cd "${pkgdir}"
	mv "${srcdir}"/dpkgdir/* .
}
