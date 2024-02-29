# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_pkgbase=asustor-platform-driver
pkgname=asustor-platform-driver-dkms-git
pkgver=49.20f84ae
pkgrel=1
pkgdesc="asustor nas driver"
arch=('x86_64')
driverversion="v0.1"
url="https://github.com/mafredri/asustor-platform-driver/"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=($_pkgbase)
conflicts=('it87-frankcrawford-dkms-git' 'it87-dkms-git')

source=("$_pkgbase::https://github.com/mafredri/asustor-platform-driver.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  sed '/@modprobe/d' -i Makefile
  sed '/@dkms/d' -i Makefile
  make dkms DKMS_ROOT_PATH_ASUSTOR="${pkgdir}"/usr/src/asustor-${driverversion}/ DKMS_ROOT_PATH_ASUSTOR_IT87="${pkgdir}"/usr/src/asustor-it87-${driverversion}/ DKMS_ROOT_PATH_ASUSTOR_GPIO_IT87="${pkgdir}"/usr/src/asustor-gpio-it87-${driverversion}/

}
