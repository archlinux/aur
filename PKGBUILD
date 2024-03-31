# Maintainer: Anysets<anysets@qq.com>
pkgname=cn.flamescion.bookworm-compatibility-mode
pkgver=12.4.11.2
pkgrel=3
pkgdesc="a container app packaging and distributing solution."
arch=('aarch64' 'x86_64')
url="https://gitee.com/amber-ce/amber-ce-bookworm"
license=('unknown')
depends=('bubblewrap'
	'xdg-desktop-portal'
	'flatpak'
	'zenity'
	'gcc'
	'dpkg'
	'debootstrap')

install=cn.flamescion.bookworm-compatibility-mode.install

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-ce-bookworm/repository/archive/${pkgver}.tar.gz")
sha256sums=('57ef48776c9c3b2a1a0dda3b6df0a7225b452d1805ca6a91196c84b0bcea43fb')

package() {
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}/src/opt ${pkgdir}/
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}/src/etc ${pkgdir}/
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}/src/usr ${pkgdir}/

	cd "${pkgdir}/opt/apps/cn.flamescion.bookworm-compatibility-mode/files"
	if [ "$CARCH" = "aarch64" ]
	then
		bash build-container.sh arm64
	elif [ "$CARCH" = "x86_64" ]
	then
		bash build-container.sh amd64
	else
		echo "Unsupported arch!"
	fi
}
