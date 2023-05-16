# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Porous3247

pkgname=ddcci-driver-linux-dkms
pkgver=0.4.3
pkgrel=6
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS)"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
conflicts=("ddcci-driver-linux")
source=(
  "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/archive/v${pkgver}/ddcci-driver-linux-v${pkgver}.tar.gz"
  "linux-6.x-compatibility.patch"
)
b2sums=('71f855b8d7e4b9a1b5d38a73d4a6df7453e72600596121f68c6782f180211bd935ab30cf0cf94cc0528e8d5f732449d35b24cd9584d17083318d819b81a0b259'
        '67e88af9c052ff8275b01229b1af388c53cb99fe4bc0a9b725797f5a98187eb8b91581dde753a76896869be568acd180f17491c6ac753d08d56572316da24b2b')

prepare() {
    cd "${srcdir}/ddcci-driver-linux-v${pkgver}"
    patch --strip=1 --forward --input="../linux-6.x-compatibility.patch"
}

package() {
  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rT "ddcci-driver-linux-v${pkgver}" "${destdir}"
}
