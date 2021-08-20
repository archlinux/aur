# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=gasket-dkms
_pkgname=gasket
pkgver=1.0
pkgrel=1
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
    'gasket-dkms_1.0-17.deb::https://packages.cloud.google.com/apt/pool/gasket-dkms_1.0-17_all_7f150cae9e4cce8d4ffdbff05e6b1c9280afed17ee5caf41ffba5d5270a3757c.deb'
)
source_armv7h=(
    'gasket-dkms_1.0-17.deb::https://packages.cloud.google.com/apt/pool/gasket-dkms_1.0-17_all_7f150cae9e4cce8d4ffdbff05e6b1c9280afed17ee5caf41ffba5d5270a3757c.deb'
)
source_aarch64=(
    'gasket-dkms_1.0-17.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_16.0_arm64_0b4fb43e4f7b44a0ce1f13b0736b3b7f03b09a24fca7e81bdb40185e98527325.deb'
)
sha256sums_x86_64=('7f150cae9e4cce8d4ffdbff05e6b1c9280afed17ee5caf41ffba5d5270a3757c')
sha256sums_armv7h=('7f150cae9e4cce8d4ffdbff05e6b1c9280afed17ee5caf41ffba5d5270a3757c')
sha256sums_aarch64=('7f150cae9e4cce8d4ffdbff05e6b1c9280afed17ee5caf41ffba5d5270a3757c')

noextract=(
    'gasket-dkms_1.0-17.deb'
)

build() {
  mkdir -p ${srcdir}/gasket-dkms/
  ar x ${srcdir}/gasket-dkms_1.0-17.deb
  tar -xJf data.tar.xz -C ${srcdir}/gasket-dkms/
}

package() {
  install -Dm644 ${srcdir}/gasket-dkms/lib/udev/rules.d/60-gasket-dkms.rules ${pkgdir}/usr/lib/udev/rules.d/60-gasket-dkms.rules
  install -Dm644 ${srcdir}/gasket-dkms/usr/src/gasket-1.0/dkms.conf ${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf
  cp -r ${srcdir}/gasket-dkms/usr/src/gasket-1.0/* ${pkgdir}/usr/src/${_pkgname}-${pkgver}/
}
