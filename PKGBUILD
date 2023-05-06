# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Porous3247

pkgname=ddcci-driver-linux-dkms
pkgver=0.4.3
pkgrel=3
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS)"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
conflicts=("ddcci-driver-linux")
source=(
  "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/archive/v${pkgver}/ddcci-driver-linux-v${pkgver}.tar.gz"
  "linux-6.3-rc2.patch"
)
b2sums=('71f855b8d7e4b9a1b5d38a73d4a6df7453e72600596121f68c6782f180211bd935ab30cf0cf94cc0528e8d5f732449d35b24cd9584d17083318d819b81a0b259'
        '6fc7e4329a6309f84886a15d17590f6ce933a1d047ee5e2cd5377f4587b9ad1f919cc619d16dc03f7bd5efdba69cedc1606ac8640ad747490ecc91252b013576')

# by UmarJ
prepare() {
    cd "${srcdir}"
    patch --directory="ddcci-driver-linux-v${pkgver}" --strip=1 --forward --input="linux-6.3-rc2.patch"
}

package() {
  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rT "ddcci-driver-linux-v${pkgver}" "${destdir}"
}
