# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Porous3247

pkgname=ddcci-driver-linux-dkms
pkgver=0.4.3
pkgrel=5
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
        'd4b602afe040b70ab4e288807ffd06b7ee8b4d1befba749c6badc03f391dcacff41f36df7d5049030754bcb9ac1b29d99abec70fcc218fb744eb2067d55e9d79')

# by UmarJ
prepare() {
    cd "${srcdir}/ddcci-driver-linux-v${pkgver}"
    patch --strip=1 --forward --input="../linux-6.3-rc2.patch"
}

package() {
  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rT "ddcci-driver-linux-v${pkgver}" "${destdir}"
}
