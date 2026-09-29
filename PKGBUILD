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
pkgrel=2
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
  'e599328cd52599596b83bd3fa60ef1abcb1fde3b8978894a071b2b4fea0f034e'  # initscript_openrc
  'de7fcc883e91a646d7be68b1c4d081d1c9c4ac628c109f3fa92064b1e8d3f361'  # initscript_systemd
  'd797f18b82be70369564662734676239557f7e038c192893c6638d6b97b984c3'  # initscript_sysvinit
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
