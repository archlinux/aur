# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
pkgname=battery-discharging-beep-git
pkgver=r14.2fc3787
pkgrel=1
_unique_package_name="arch-install"
pkgdesc="Generate a sound when the battery is discharging."
arch=(x86_64)
url="https://github.com/airvzxf/linux-battery-discharging-beep.git"
license=('GPL-3.0')
makedepends=(git bash)
provides=(battery-discharging-beep)
conflicts=(battery-discharging-beep)
options=()
source=("${_unique_package_name}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${_unique_package_name}" || return
  (
    set -o pipefail
    git describe --long 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${_unique_package_name}/src" || return
  chmod 755 battery-discharging-beep
  sudo cp battery-discharging-beep /usr/bin/
}
