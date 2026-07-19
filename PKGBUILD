# Maintainer: Caitlyn Williams <caitlyn dot williams at proton dot me>

pkgname=qlcplus4-bin
pkgver=4.14.4
pkgrel=2
pkgdesc="Open-source lighting control for DMX, Art-Net, sACN and more."
arch=('x86_64')
url="https://www.qlcplus.org"
license=("Apache-2.0")
depends=(
  'fftw'
  'libftdi'
  'libmad'
  'libsndfile'
  'qt6-3d'
  'qt6-multimedia'
  'qt6-serialport'
  'qt6-svg'
  'qt6-websockets'
)
optdepends=(
  'ola: Open Lighting Architecture plugin'
)
provides=('qlcplus' 'qlcplus4')
conflicts=('qlcplus')
options=('strip' '!libtool' '!staticlibs' '!emptydirs')
source=("qlcplus-${pkgver}.deb::https://www.qlcplus.org/downloads/${pkgver}/qlcplus_${pkgver}_amd64.deb")

package() {
	tar -xvf ${srcdir}/data.tar.zst -C ${pkgdir}
	mv -vn ${pkgdir}/usr/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib/ # move libraries into path
	install -d -m755 ${pkgdir}/usr/lib/udev/rules.d/
	mv -vn ${pkgdir}/etc/udev/rules.d/* ${pkgdir}/usr/lib/udev/rules.d/ # move udev rules into location for standard hook
}

sha256sums=('2a1145eb38a7393076c5e56fa8350e9c9f6109571f82810738567c199fd7c83d')
