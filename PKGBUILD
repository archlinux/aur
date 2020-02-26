# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=xr-hardware-git
pkgver=0.2.1.r0.g3b7d526
pkgrel=1
pkgdesc="Udev rules for allowing USB access to popular XR/VR/AR headsets"
arch=('any')
url="https://gitlab.freedesktop.org/monado/utilities/xr-hardware"
license=('Boost')
conflicts=("oculus-udev" "osvr-udev" "vive-udev")
provides=("oculus-udev" "osvr-udev" "vive-udev")
makdepends=('python-attrs')
source=('git+https://gitlab.freedesktop.org/monado/utilities/xr-hardware.git')
sha256sums=('SKIP')
install='xr-hardware.install'

pkgver() {
  cd xr-hardware
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd xr-hardware
  make PYTHON=python clean_package
  make PYTHON=python all
}

package() {
  cd xr-hardware
  make PYTHON=python DESTDIR="$pkgdir" PREFIX=/usr install_package
}
