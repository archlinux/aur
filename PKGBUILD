# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: adrien1018 (https://aur.archlinux.org/account/adrien1018)
# Contributor: fs4000
# Contributor: trapanator
# Contributor: tomprogrammer

_pkgbase=phc-intel-scripts
pkgbase="${_pkgbase}"
pkgname=("phc-intel-scripts" "phc-intel-openrc" "phc-intel-sysvinit" "phc-intel-systemd")
groups=(
  'linux-phc'
  'phc-intel'
)
pkgver=0.3
pkgrel=6
pkgdesc="Helper and init scripts for phc-intel, a frequency driver for Intel CPUs with undervolting feature."
url="https://gitlab.com/linux-phc/phc-intel"
arch=('any')
license=('GPL2')
makedepends=()
source=(
  'phc-intel.conf.default'
  'phc-intel.sh'
  'phc-intel.sleep.pm-utils'
  'phc-intel.sleep.systemd'
  'phc-intel.openrc'
  'phc-intel.sysvinit'
  'phc-intel.systemd'
  'phc-intel-scripts.install'
)
sha256sums=(
  'ce08a5a4107be1d5723f1f169d515e67b6c77893f3994fc2d0d2ccf611307ed3' # phc-intel.conf.default
  'b3144438cc796b96515508ebbbb22f854fcd36a3af31872da090af85f4f6d441' # phc-intel.sh
  '3f965edca571e5a4d2dd60939b252e15062b440ce6eb87021dc3170682eff0d7' # phc-intel.sleep.pm-utils
  '0217a76958e2aba747c89bfd3bef16dcd8377770014896ab749faf16c05a2e53' # phc-intel.sleep.systemd
  '66be32665dd8e3c153ce512678d3af3cbf24f36829556590736e0c21baf82d28' # phc-intel.openrc
  'a18474513c628877d117bd3b096f085b95e5ec4f3618bb6eb59a1db1dd67de1b' # phc-intel.sysvinit
  '345b479cce16e2ac2a3b001123aa2b4f16be21c63ba9c7e9e3cc5865d3c01d8c' # phc-intel.systemd
  '3d7b7bd26e3bbd93eac8098fe8d688eecd7697fec345ef829b957680e0b4a360' # phc-intel-scripts.install
)

package_phc-intel-scripts() {
  pkgdesc="Helper scripts for phc-intel, a frequency driver for Intel CPUs with undervolting feature."
  install='phc-intel-scripts.install'
  depends=(
    'bash'
    'PHC-INTEL-MODULE' # This means kernel-side support; packages providing kernel module, but also kernel packages which have that builtin, can set this.
  )
  optdepends=()
  provides=()
  conflicts=()
  replaces=()

  backup=(
    'etc/default/phc-intel'
  )


  cd "${srcdir}"

  install -Dvm644 phc-intel.conf.default    "${pkgdir}/etc/default/phc-intel"
  install -Dvm755 phc-intel.sh              "${pkgdir}/usr/bin/phc-intel"
  install -Dvm755 phc-intel.sleep.pm-utils  "${pkgdir}/usr/lib/pm-utils/sleep.d/00phc-intel"
  install -Dvm755 phc-intel.sleep.systemd   "${pkgdir}/usr/lib/systemd/system-sleep/phc-intel"
}

package_phc-intel-openrc() {
  pkgdesc="OpenRC init scripts for phc-intel, a frequency driver for Intel CPUs with undervolting feature."
  depends=(
    'bash'
    'phc-intel-scripts'
  )
  optdepends=(
    'openrc: To use this initscript.'
  )
  provides=('PHC-INTEL-INITSCRIPT')
  conflicts=()
  replaces=()

  cd "${srcdir}"

  install -Dvm755 'phc-intel.openrc' "${pkgdir}/etc/init.d/phc-intel"
}

package_phc-intel-sysvinit() {
  pkgdesc="System V init scripts for phc-intel, a frequency driver for Intel CPUs with undervolting feature."
  depends=(
    'bash'
    'phc-intel-scripts'
  )
  optdepends=(
    'sysvinit: To use this initscript.'
  )
  provides=('PHC-INTEL-INITSCRIPT')
  conflicts=()
  replaces=()

  cd "${srcdir}"

  install -Dvm755 'phc-intel.sysvinit' "${pkgdir}/etc/rc.d/phc-intel"
}

package_phc-intel-systemd() {
  pkgdesc="systemd init scripts for phc-intel, a frequency driver for Intel CPUs with undervolting feature."
  depends=(
    'phc-intel-scripts'
  )
  optdepends=(
    'systemd: To use this initscript.'
  )
  provides=('PHC-INTEL-INITSCRIPT')
  conflicts=()
  replaces=()

  cd "${srcdir}"

  install -Dvm644 'phc-intel.systemd' "${pkgdir}/usr/lib/systemd/system/phc-intel.service"
}