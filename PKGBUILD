# Maintainer: Anysets<anysets@qq.com>
pkgname=amber-ce-bookworm
pkgver=12.6.5
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
	'procps-ng'
	'rsync')
makedepends=('dpkg')

install=amber-ce-bookworm.install

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-ce-bookworm/repository/archive/${pkgver}.tar.gz")
sha256sums=('b1e8b47be2b5b2d2c174a7ddee371781afa8dc23b6c8eed7b6eaf271ea9df334')

package() {
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}/src/opt ${pkgdir}/
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}/src/etc ${pkgdir}/
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}/src/usr ${pkgdir}/
    
	cd "${pkgdir}/opt/apps/amber-ce-bookworm/files"
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
