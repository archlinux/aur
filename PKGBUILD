# Maintainer: Nicolas Chauvin <dev [dot] nicolas [at] chauv [dot] in>

_pkgname=wait-urandom-init
pkgname=${_pkgname}-git
_gitname=${_pkgname}
pkgver=r6.3d5732c
pkgrel=1
pkgdesc="Command line tool which waits for the urandom source to be initialized before returning"
arch=(any)
url="https://github.com/Grenadingue/${_gitname}"
license=('GPL3')
makedepends=('git')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  # generate a package version string from the git repository
  cd "${_gitname}" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}" || return 1
  msg2 "Compiling ${_pkgname}"
  make re
}

package() {
  msg2 "Creating target install directory..."
  mkdir -p "${pkgdir}/usr/bin"

  msg2 "Copying output binary..."
  install -Dm755 "${_gitname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  msg2 "Updating package ownership to root:root..."
  chown -R root:root "${pkgdir}/"
}
