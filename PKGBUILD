# Maintainer: Anysets<anysets@qq.com>
pkgname=cn.flamescion.bookworm-compatibility-mode
pkgver=12.4.2
pkgrel=1
pkgdesc="a container app packaging and distributing solution."
arch=('aarch64' 'x86_64')
url="https://gitee.com/amber-compatability-environment/bookworm-compatibility-mode"
license=('unknown')
depends=('bubblewrap'
	'xdg-desktop-portal'
	'flatpak'
	'zenity'
	'gcc'
	'dpkg'
	'debootstrap')

install=cn.flamescion.bookworm-compatibility-mode.install

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-compatability-environment/bookworm-compatibility-mode/repository/archive/${pkgver}.tar.gz")
#source=("https://gitee.com/amber-compatability-environment/bookworm-compatibility-mode.git")
sha256sums=('a3063523f8a18e26b95bf7c23150c8fb18b136a853597f35ab847f2f3a47c711')

package() {
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/opt ${pkgdir}/
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/etc ${pkgdir}/
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/usr ${pkgdir}/
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/opt/apps/cn.flamescion.bookworm-compatibility-mode/entries/applications ${pkgdir}/usr/share
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/opt/apps/cn.flamescion.bookworm-compatibility-mode/entries/icons ${pkgdir}/usr/share

	cd "${pkgdir}/opt/apps/cn.flamescion.bookworm-compatibility-mode/files"
	echo $CARCH
	if [ "$CARCH" = "aarch64" ]
	then
		sh build-container.sh arm64
	elif [ "$CARCH" = "x86_64" ]
	then
		sh build-container.sh amd64
	else
		echo "Unsupportable arch!"
	fi
}
