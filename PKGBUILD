# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: adrien1018 (https://aur.archlinux.org/account/adrien1018)
# Contributor: fs4000
# Contributor: trapanator
# Contributor: tomprogrammer

_pkgbase=phc-intel-scripts
pkgbase="${_pkgbase}"
_pkgname="${_pkgbase}"
pkgname="${pkgbase}"
groups=(
  'linux-phc'
  'phc-intel'
)
pkgver=0.2
# _phcver="$(pacman -Q phc-intel | awk '{print $2}')" # Version of the installed package `phc-intel`.
pkgrel=1
pkgdesc="Helper scripts for phc-intel, a frequency driver for Intel CPUs with undervolting feature."
url="https://gitlab.com/linux-phc/phc-intel"
arch=('any')
license=('GPL2')
depends=(
  'bash'
  'phc-intel'
)
makedepends=()
optdepends=()
provides=()
conflicts=()
backup=(
  'etc/default/phc-intel'
)
install='phc-intel-scripts.install'
source=(
  'phc-intel.conf.default'
  'phc-intel.sh'
  'phc-intel.sleep.pm-utils'
  'phc-intel.sleep.systemd'
  "${install}"
)
sha256sums=(
  'ce08a5a4107be1d5723f1f169d515e67b6c77893f3994fc2d0d2ccf611307ed3' # 'phc-intel.conf.default'
  'b526f3e8e66f6495531f13f2e6867d3a07b2ec7a7c3b8aa061f22be1cd6e770f' # 'phc-intel.sh'
  '569b85988cb38380fec85c25688b76abc24a46601aa8f58eb24eaebf863eebef' # 'phc-intel.sleep.pm-utils'
  '2e17c90d7bfae8f5070e46388e95d443188eaa7beb5ffdd418a0da090f2e7557' # 'phc-intel.sleep.systemd'
  '3d7b7bd26e3bbd93eac8098fe8d688eecd7697fec345ef829b957680e0b4a360' # ${install}
)

package() {
  cd "${srcdir}"

  install -Dvm644 phc-intel.conf.default         "${pkgdir}/etc/default/phc-intel"
  install -Dvm755 phc-intel.sh              "${pkgdir}/usr/bin/phc-intel"
  install -Dvm755 phc-intel.sleep.pm-utils  "${pkgdir}/usr/lib/pm-utils/sleep.d/00phc-intel"
  install -Dvm755 phc-intel.sleep.systemd   "${pkgdir}/usr/lib/systemd/system-sleep/phc-intel"
}
