# Maintainer: Anysets<anysets@qq.com>
pkgname=amber-ce-bookworm
pkgver=12.4.14
pkgrel=1
pkgdesc="a container app packaging and distributing solution."
arch=('aarch64' 'x86_64' 'loong64')
url="https://gitee.com/amber-ce/amber-ce-bookworm"
license=('unknown')
depends=('bubblewrap'
	'xdg-desktop-portal'
	'flatpak'
	'zenity'
	'gcc'
	'dpkg'
	'debootstrap'
	'procps-ng')

install=amber-ce-bookworm.install

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-ce-bookworm/repository/archive/${pkgver}.tar.gz")
sha256sums=('a91ddf4aee15b1a9cb96e98ca9ffa6c29a8099acf3e1598a161c449c9d044326')

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
	elif [ "$CARCH" = "loong64" ]
	then
		bash build-container.sh loong64
	else
		echo "Unsupported arch!"
	fi
}
