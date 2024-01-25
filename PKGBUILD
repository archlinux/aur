# Maintainer:  dreieck

_pkgbase='gpd-winmax2_2023-fix-sleep-wakeuptriggers'
pkgbase="${_pkgbase}"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-openrc"
  "${pkgbase}-systemd"
  "${pkgbase}-sysvinit"
)
epoch=1
pkgver=20240125.01
pkgrel=1
pkgdesc="Switches off wakeup triggers that prevent the GPD Win Max 2 (2023) laptops from sleeping reliably."
arch=(
  'any'
)
url="https://gitlab.freedesktop.org/drm/amd/-/issues/3073#note_2237586"
license=('GPL-3.0-only')
makedepends=()
checkdepends=()
options+=('emptydirs')

source=(
  'gpd-winmax2_2023-fix-sleep-wakeuptriggers.sh'
  'gpd-winmax2_2023-sleep-wakeuptriggers.conf'
  'initscript_openrc'
  'initscript_systemd'
  'initscript_sysvinit'
)

sha256sums=(
  '6eae6cae796f6c147dca509d2f31d00bb91fc7447291a17659e81e528b1a08f7'  # gpd-winmax2_2023-fix-sleep-wakeuptriggers.sh
  '458107c1dd557543d0181ce0945bce5776761a1ccaf8da8bf4039c7a7cf95787'  # gpd-winmax2_2023-sleep-wakeuptriggers.conf
  '7cb27de003f90204b9c67dee7310c56ae55c64363b0f4d95c256f169ade841fd'  # initscript_openrc
  '938442e03980e5e872263ce986f8c21de93aaa55c68945f54d18b5e8735a7ae0'  # initscript_systemd
  '80bd5a4734de44220fc588c3f317dd1c45d5deed911111b867544908b91d9e8c'  # initscript_sysvinit
)

pkgver() {
  cd "${srcdir}"

  ./"gpd-winmax2_2023-fix-sleep-wakeuptriggers.sh" --version
}

package_gpd-winmax2_2023-fix-sleep-wakeuptriggers() {
  pkgdesc="Script and configuration file to switch off wakeup triggers that prevent the GPD Win Max 2 (2023) laptops from sleeping reliably."
  depends=(
    "bash"
  )
  optdepends=(
    "${_pkgbase}-openrc: For openrc iniscript."
    "${_pkgbase}-systemd: For systemd service file."
    "${_pkgbase}-sysvinit: For system-V-style initscript."
  )
  backup=(
    'etc/gpd-winmax2_2023-sleep-wakeuptriggers.conf'
  )

  cd "${srcdir}"

  install -Dvm755  "gpd-winmax2_2023-fix-sleep-wakeuptriggers.sh"  "${pkgdir}/usr/bin/gpd-winmax2_2023-fix-sleep-wakeuptriggers"
  install -Dvm644  "gpd-winmax2_2023-sleep-wakeuptriggers.conf"    "${pkgdir}/etc/gpd-winmax2_2023-sleep-wakeuptriggers.conf"
}

package_gpd-winmax2_2023-fix-sleep-wakeuptriggers-openrc() {
  pkgdesc="OpenRC init script for '${_pkgbase}'."
  depends=(
    "${_pkgbase}"
  )
  optdepends=(
    'openrc: To run the OpenRC initscript.'
  )

  cd "${srcdir}"
  install -D -m755 "${srcdir}/initscript_openrc"   "${pkgdir}/etc/init.d/gpd-winmax2_2023-fix-sleep-wakeuptriggers"
}

package_gpd-winmax2_2023-fix-sleep-wakeuptriggers-systemd() {
  pkgdesc="Systemd service file '${_pkgbase}'."
  depends=(
    "${_pkgbase}"
  )
  optdepends=(
    "systemd: To run the Systems init'script'."
  )

  cd "${srcdir}"
  install -D -m644 "${srcdir}/initscript_systemd"  "${pkgdir}/usr/lib/systemd/system/gpd-winmax2_2023-fix-sleep-wakeuptriggers.service"
}

package_gpd-winmax2_2023-fix-sleep-wakeuptriggers-sysvinit() {
  pkgdesc="System V style init script for '${_pkgbase}'."
  depends=(
    "${_pkgbase}"
  )
  optdepends=(
    'sysvinit: To run the System V style initscript.'
  )

  cd "${srcdir}"
  install -D -m755 "${srcdir}/initscript_sysvinit" "${pkgdir}/etc/rc.d/gpd-winmax2_2023-fix-sleep-wakeuptriggers"
}
