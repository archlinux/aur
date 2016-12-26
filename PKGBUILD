# Maintainer: Jay Little <jaylittle at jaylittle dot com>

pkgname=pi-top-control-git
_pkgname=pi-top-control
pkgver=r16.1995671
pkgrel=1
pkgdesc="Python script that provides control of Pi-Top hub hardware"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jaylittle/pi-top-control"
license=('GPL')
depends=('python' 'i2c-tools-git' 'python-smbus' 'python-spidev')
makedepends=('python' 'git')
provides=('pi-top-control')
conflicts=('pi-top-control')
options=('!strip')
source=('pi-top-control::git+https://github.com/jaylittle/pi-top-control.git')
md5sums=('SKIP')
install=pi-top-control.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  umask 022
  mkdir -p out/usr/lib/systemd/system
  mkdir -p out/opt
  mkdir -p out/etc/udev/rules.d
  make install ROOTDIR="${srcdir}/${_pkgname}/out"
}

package() {
  cd "${pkgdir}"
  cp -r "${srcdir}/${_pkgname}/out/usr" "${pkgdir}"
  cp -r "${srcdir}/${_pkgname}/out/opt" "${pkgdir}"
  cp -r "${srcdir}/${_pkgname}/out/etc" "${pkgdir}"
}

