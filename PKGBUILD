#Maintainer: jakyote <jakkyote - gmail>

pkgname=notepadqq-ote-git
_pkgname=notepadqq
pkgver=0.52.1.r631.gbfbdf7c
pkgrel=1
pkgdesc="Notepad++-like editor for the Linux desktop w/ OTE backend"
arch=('x86_64')
url="https://github.com/JuBan1/notepadqq"
license=('GPL3')
depends=('qt5-base' 'uchardet' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('nodejs: Extensions support (experimental)')
makedepends=('git' 'qt5-tools')
provides=('notepadqq')
conflicts=('notepadqq' 'notepadqq-legacy' 'notepadqq-git')
options=('!emptydirs')
source=("git+https://github.com/JuBan1/notepadqq.git")
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
