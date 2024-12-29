# Maintainer: Anysets<anysets@qq.com>
pkgname=amber-ce-bookworm
pkgver=12.4.15
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
	'debootstrap'
	'procps-ng')

install=amber-ce-bookworm.install

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-ce-bookworm/repository/archive/${pkgver}-${pkgrel}.tar.gz")
sha256sums=('074213736c39f69c45f07b897f1ce4a0e9490e82ff767c48b1fcd784891f3adb')

package() {
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}-${pkgrel}/src/opt ${pkgdir}/
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}-${pkgrel}/src/etc ${pkgdir}/
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}-${pkgrel}/src/usr ${pkgdir}/

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
