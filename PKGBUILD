# Maintainer: Victor Bonnelle <victor.bonnelle@proton.me>

pkgname=notepadqq-victorbnl-git
_pkgname=notepadqq
pkgver=r1503.2cd37eb
pkgrel=1
pkgdesc="Notepad++-like editor for the Linux desktop (victorbnl's fork)"
arch=('x86_64')
url="https://github.com/victorbnl/notepadqq"
license=('GPL3')
depends=('qt5-base' 'uchardet' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('nodejs: Extensions support (experimental)')
makedepends=('git' 'qt5-tools')
provides=('notepadqq')
conflicts=('notepadqq' 'notepadqq-legacy' 'notepadqq-git' 'notepadqq-ote-git')
options=('!emptydirs')
source=("git+https://github.com/victorbnl/notepadqq.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  set -o pipefail
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  ./configure --prefix /usr
  make
}

package() {
  cd "${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}
