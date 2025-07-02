# Maintainer: Alex Potapenko <opotapenko@gmail.com>
# Submitter and original maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Temporary Maintainer: bluetail

pkgname=vmware-host-modules-dkms-fix-git
_pkgname=vmware-host-modules
pkgver=17.6.3
_branch_version=17.6.3
url="https://github.com/philipl/vmware-host-modules"
pkgrel=1
epoch=2
pkgdesc="VMware (Player and Workstation) host kernel modules with patches needed to build against recent kernels"
arch=('x86_64' 'aarch64' 'i386')
license=('GPL2')
provides=(vmware-host-modules-dkms vmware-host-modules)
conflicts=(vmware-host-modules-dkms vmware-host-modules)
depends=('dkms')
makedepends=('git')

source=(
  "vmware-host-modules-workstation-${_branch_version}.tar.gz::https://github.com/philipl/vmware-host-modules/archive/refs/heads/workstation-17.6.3.tar.gz"
  dkms-vmmon.conf
  dkms-vmnet.conf
)

sha256sums=('5d2185d5d29b5b4a84d69dd2a506a6c4f27a2c4173112c5e54cbcbfd35c2060e'
            'ed52e41b8f2b525915d47c350f4e6dec064b01d6f894e32b513a01e0f1162c4d'
            'b218e4ec45f5c2f960333d209442a0a98fa525ee034947c0be724f2f77d0a4a9')

prepare() {
  tar xf "${srcdir}/vmware-host-modules-workstation-${_branch_version}.tar.gz" -C "${srcdir}"
}

package() {
  install -dm755 "${pkgdir}/usr/src/vmmon-1"
  install -dm755 "${pkgdir}/usr/src/vmnet-1"

  cp -r "${srcdir}/vmware-host-modules-workstation-${_branch_version}/vmmon-only/"* "${pkgdir}/usr/src/vmmon-1/"
  cp -r "${srcdir}/vmware-host-modules-workstation-${_branch_version}/vmnet-only/"* "${pkgdir}/usr/src/vmnet-1/"

  # Install DKMS configs
  cp "${srcdir}/dkms-vmmon.conf" "${pkgdir}/usr/src/vmmon-1/dkms.conf"
  cp "${srcdir}/dkms-vmnet.conf" "${pkgdir}/usr/src/vmnet-1/dkms.conf"
}
