# Maintainer: Anysets<anysets@qq.com>
pkgname=amber-ce-bookworm
pkgver=12.6.3
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
sha256sums=('3a3ee8fadf13bf7b94be38ddb75f3f464658e2d4e82e22e97fb4fba6dcc75c2c')

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
