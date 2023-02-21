# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: adrien1018 (https://aur.archlinux.org/account/adrien1018)
# Contributor: fs4000
# Contributor: trapanator
# Contributor: tomprogrammer

_pkgbase=phc-intel-scripts
pkgbase="${_pkgbase}"
pkgname=("${pkgbase}" "phc-intel-openrc" "phc-intel-sysvinit" "phc-intel-systemd")
groups=(
  'linux-phc'
  'phc-intel'
)
pkgver=0.2
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
  '7450e00dbac86560dca37c494de40a9c79250958df0795b89668b494c18855ed' # phc-intel.sh
  '569b85988cb38380fec85c25688b76abc24a46601aa8f58eb24eaebf863eebef' # phc-intel.sleep.pm-utils
  '2e17c90d7bfae8f5070e46388e95d443188eaa7beb5ffdd418a0da090f2e7557' # phc-intel.sleep.systemd
  '66be32665dd8e3c153ce512678d3af3cbf24f36829556590736e0c21baf82d28' # phc-intel.openrc
  'a18474513c628877d117bd3b096f085b95e5ec4f3618bb6eb59a1db1dd67de1b' # phc-intel.sysvinit
  '2998dea86b1c69a2f0668afd025de154bf3b9b6d0803bf3e3f46eab26d2df13f' # phc-intel.systemd
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
  replaces=(
    "phc-intel<=0.3.2.rev44"
  )

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
  provides=()
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
  provides=()
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
  provides=()
  conflicts=()
  replaces=()

  cd "${srcdir}"

  install -Dvm755 'phc-intel.systemd' "${pkgdir}/usr/lib/systemd/system/phc-intel.service"
}