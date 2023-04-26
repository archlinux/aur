# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=arduino-theme-dracula-git
_name=dracula
pkgver=r13.7a59785
pkgrel=1
pkgdesc="🧛🏻‍♂️ Dark theme for Arduino IDE "
arch=('any')
url="https://github.com/dracula/arduino-ide"
license=('MIT')
depends=('arduino')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/dracula/arduino-ide.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}"
  _dest="${pkgdir}/usr/share/arduino/lib/theme"
  install -dm644 "${_dest}"
  cd theme/
  bsdtar -a -cf "${_dest}/${_name}.zip" *
}
