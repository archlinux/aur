# Maintainer:  dreieck
# Contributor: Your Name <youremail@domain.com>

_pkgname=random_machine_id
pkgname="${_pkgname}-openrc"

pkgver=20230728.02
pkgrel=1
pkgdesc="OpenRC init script that generates a new /etc/machine-id on each boot."
arch=(
  'any'
)
url="https://aur.archlinux.org/packages/${pkgname}"
license=('GPL3')
depends=(
  'bash'
  'dbus'
)
makedepends=()
optdepends=(
  "openrc: To make use of the initscript."
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  'random_machine_id.sh'
  'random_machine_id.openrc'
)
sha256sums=(
  'adb283b1c22b0d6f87fb11c437188b567886364fdf731e4a1b13274eca7f475b'
  '80f56b2e612c92e0bdc6d7518d85dce4059811232c505b3049eb15e7e14c0226'
)

pkgver() {
  bash "${srcdir}/random_machine_id.sh" --version
}

package() {
  install -Dvm755 "${srcdir}/random_machine_id.sh" "${pkgdir}/usr/bin/random_machine_id.sh"  # Provide the '.sh' variant to be drop-in compatible with the package 'random_machine_id'
  ln -svr "${pkgdir}/usr/bin/random_machine_id.sh" "${pkgdir}/usr/bin/random_machine_id"

  install -Dvm755 "${srcdir}/random_machine_id.openrc" "${pkgdir}/etc/init.d/random_machine_id"
}
