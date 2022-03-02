# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=gasket-dkms
_pkgname=gasket
pkgver=1.0
pkgrel=2
pkgdesc='Google Coral driver for PCIe-based Edge TPU devices, such as the M.2 and Mini PCIe Accelerator'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://coral.withgoogle.com/'
license=('GPL2')
options=(!strip)
depends=('dkms')
makedepends=('sed' 'binutils')
# The links to the files are taken from:
# https://packages.cloud.google.com/apt/dists/coral-edgetpu-stable/main
source_x86_64=(
  'gasket-dkms_1.0-18.deb::https://packages.cloud.google.com/apt/pool/gasket-dkms_1.0-18_all_00606bc20aed9a7d2a9da7a6d51a87dbc7f275be392fb3e1131ef6f627a49168.deb'
)
source_armv7h=(
  'gasket-dkms_1.0-18.deb::https://packages.cloud.google.com/apt/pool/gasket-dkms_1.0-18_all_00606bc20aed9a7d2a9da7a6d51a87dbc7f275be392fb3e1131ef6f627a49168.deb'
)
source_aarch64=(
  'gasket-dkms_1.0-18.deb::https://packages.cloud.google.com/apt/pool/gasket-dkms_1.0-18_all_00606bc20aed9a7d2a9da7a6d51a87dbc7f275be392fb3e1131ef6f627a49168.deb'
)
sha256sums_x86_64=('00606bc20aed9a7d2a9da7a6d51a87dbc7f275be392fb3e1131ef6f627a49168')
sha256sums_armv7h=('00606bc20aed9a7d2a9da7a6d51a87dbc7f275be392fb3e1131ef6f627a49168')
sha256sums_aarch64=('00606bc20aed9a7d2a9da7a6d51a87dbc7f275be392fb3e1131ef6f627a49168')

noextract=(
    'gasket-dkms_1.0-18.deb'
)

build() {
  mkdir -p ${srcdir}/gasket-dkms/
  ar x ${srcdir}/gasket-dkms_1.0-18.deb
  tar -xJf data.tar.xz -C ${srcdir}/gasket-dkms/
}

package() {
  install -Dm644 ${srcdir}/gasket-dkms/lib/udev/rules.d/60-gasket-dkms.rules ${pkgdir}/usr/lib/udev/rules.d/60-gasket-dkms.rules
  install -Dm644 ${srcdir}/gasket-dkms/usr/src/gasket-1.0/dkms.conf ${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf
  cp -r ${srcdir}/gasket-dkms/usr/src/gasket-1.0/* ${pkgdir}/usr/src/${_pkgname}-${pkgver}/
}
