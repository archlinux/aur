# Maintainer: Anysets<anysets@qq.com>
pkgname=cn.flamescion.bookworm-compatibility-mode
pkgver=12.4.10
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
sha256sums=('b08687b2d897352af95bcf21f54544478e44b83234acb126761aac6f39711a2a')

package() {
	cp -rf ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/opt ${pkgdir}/
	cp -rf ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/etc ${pkgdir}/
	cp -rf ${srcdir}/bookworm-compatibility-mode-${pkgver}/src/usr ${pkgdir}/

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
