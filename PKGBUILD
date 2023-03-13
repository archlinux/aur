# Maintainer: crab2313 <crab2313@gmail.com>

pkgname=libselinux-static
_pkgname=${pkgname%-static}
pkgver=3.4
pkgrel=1
pkgdesc="SELinux library (static version)"
arch=('x86_64')
url='https://github.com/SELinuxProject/selinux'
license=('custom')
groups=('selinux')
makedepends=()
depends=('libsepol>=3.1')
options=(staticlibs)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('77c294a927e6795c2e98f74b5c3adde9c8839690e9255b767c5fca6acff9b779')

build() {
  cd "${_pkgname}-${pkgver}"

  # Do not build deprecated rpm_execcon() interface. It is useless on Arch Linux anyway.
  export DISABLE_RPM=y

  export CFLAGS="${CFLAGS} -fno-semantic-interposition"
  make -C src libselinux.a
}

package() {
  cd "${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib"
  export DISABLE_RPM=y

  install -Dm 0755 src/libselinux.a ${pkgdir}/usr/lib/
}

