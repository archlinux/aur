# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
_name=battery-discharging-beep
_git_project=linux-"${_name}"
pkgname="${_name}"-git
pkgver=r19.d860a26
pkgrel=2
pkgdesc="Generate a sound when the battery is discharging."
arch=(x86_64)
url="https://github.com/airvzxf/${_git_project}.git"
license=('GPL-3.0')
makedepends=(git bash)
provides=("${_name}")
conflicts=("${_name}")
options=()
source=("${_name}::git+${url}#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}" || return
  (
    set -o pipefail
    git describe --long 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_name}" || return
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "src" || return
  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
}
