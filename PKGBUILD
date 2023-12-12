# Maintainer: Anysets<anysets@qq.com>
pkgname=cn.flamescion.bookworm-compatibility-mode
pkgver=12.4.5
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
sha256sums=('932357b2d1049afe74dd656b94eb849d6740a68d92e5d125a831ae21b1db7144')

package() {
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/opt ${pkgdir}/
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/etc ${pkgdir}/
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/usr ${pkgdir}/
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/opt/apps/cn.flamescion.bookworm-compatibility-mode/entries/applications ${pkgdir}/usr/share
	cp -r ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/opt/apps/cn.flamescion.bookworm-compatibility-mode/entries/icons ${pkgdir}/usr/share

	cd "${pkgdir}/opt/apps/cn.flamescion.bookworm-compatibility-mode/files"
	if [ "$CARCH" = "aarch64" ]
	then
		bash build-container.sh arm64
	elif [ "$CARCH" = "x86_64" ]
	then
		bash build-container.sh amd64
	else
		echo "Unsupportable arch!"
	fi
}
