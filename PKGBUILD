# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Marc Schulte <bomba@nerdstube.de>

pkgbase=tlp-git
pkgname=(
  tlp-git
  tlp-rdw-git
)
pkgver=1.2.1.r22.5d2abde
pkgrel=1
arch=(any)
url=https://linrunner.de/en/tlp/tlp.html
license=(GPL2)
makedepends=(git)
source=(git+https://github.com/linrunner/TLP.git)
sha256sums=(SKIP)

pkgver() {
  cd TLP

  echo "$(git describe --tags | sed 's/-/.r/; s/-g/./')"
}

package_tlp-git() {
  pkgdesc='Linux Advanced Power Management'
  depends=(
    hdparm
    iw
    pciutils
    rfkill
    usbutils
    util-linux
  )
  optdepends=(
    'bash-completion: Bash completion'
    'ethtool: Disable Wake On Lan'
    'lsb-release: Display LSB release version in tlp-stat'
    'smartmontools: Display S.M.A.R.T. data in tlp-stat'
    'x86_energy_perf_policy: Set energy versus performance policy on x86 processors'
  )
  provides=(tlp)
  conflicts=(
    laptop-mode-tools
    pm-utils
    tlp
  )
  backup=(etc/default/tlp)

  export TLP_SBIN=/usr/bin
  export TLP_ULIB=/usr/lib/udev
  export TLP_SYSD=/usr/lib/systemd/system
  export TLP_NO_INIT=1
  export TLP_WITH_SYSTEMD=1
  export TLP_WITH_ELOGIND=0

  make DESTDIR="${pkgdir}" -C TLP install-tlp install-man
}

package_tlp-rdw-git() {
  pkgdesc='Linux Advanced Power Management - Radio Device Wizard'
  depends=(
    networkmanager
    tlp
  )
  provides=(tlp-rdw)
  conflicts=(tlp-rdw)

  make DESTDIR="${pkgdir}" -C TLP install-rdw install-man-rdw
}

# vim: ts=2 sw=2 et:
