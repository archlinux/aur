# Maintainer: crab2313 <crab2313@gmail.com>

pkgname=libselinux-static
_pkgname=${pkgname%-static}
pkgver=3.8.1
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
sha256sums=('ec2d2789f931152d21c1db1eb4bc202ce4eccede34d9be9e360e3b45243cee2c')

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

