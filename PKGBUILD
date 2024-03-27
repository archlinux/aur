# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>

_pkgbase='nsproxy'
pkgname="${_pkgbase}-git"
pkgver=0.2.0.3.g7306d12
pkgrel=1
pkgdesc='A tool to force applications to use a specific SOCKS5 or HTTP proxy (git version to track dev branch)'
url="https://github.com/nlzy/${_pkgbase}"
license=('GPL-2.0-or-later')
source=("git+${url}.git#branch=dev")
sha256sums=('SKIP')
arch=('any')
makedepends=('cmake' 'linux-api-headers')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}=${pkgver}")

pkgver() {
  local _pkgver=$(git --git-dir "${_pkgbase}/.git" describe)
  _pkgver="${_pkgver//-/.}"
  printf '%s' "${_pkgver#v}"
}

build() {
  cmake -B build -S "${_pkgbase}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  install -Dm755 "build/${_pkgbase}" "${pkgdir}"/usr/bin/"${_pkgbase}"
}
