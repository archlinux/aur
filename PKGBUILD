# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>

pkgname=tpacpi-bat-git
_pkgname="${pkgname%-*}"
pkgver=93.9374d51
pkgrel=1
pkgdesc="A Perl script with ACPI calls for recent ThinkPads (such as T420 and W520) whose battery thresholds are not supported by tp_smapi"
url="https://github.com/teleshoes/tpacpi-bat"
license=("GPLv3")
arch=("any")
depends=("perl" "acpi_call")
makedepends=("git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://github.com/teleshoes/tpacpi-bat.git"
        "tlp.patch")
md5sums=("SKIP"
         "9799f80a35939a0dd009d05c94418fbf")

pkgver() {
  cd "${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}


prepare() {
  cd "${_pkgname}"
#  patch -uNp1 -i "${srcdir}/tlp.patch"
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${_pkgname}"            "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname%-*}.service"    "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
