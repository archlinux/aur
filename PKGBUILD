# Maintainer:  chet <chetgurevitch @ protonmail . com>

pkgname=auracle-git-patched
pkgver=r23.90b1793
pkgrel=1
pkgdesc='A flexible client for the AUR'
arch=('x86_64' 'i686')
url='https://github.com/falconindy/auracle.git'
license=('MIT')
depends=('libarchive.so' 'libcurl.so' 'pacman')
makedepends=('git' 'meson')
provides=("auracle=${pkgver}")
conflicts=('auracle')
source=("${pkgname}::git+https://github.com/falconindy/auracle.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "${pkgname}"

  if [[ ! -d _build ]]; then
    meson _build --prefix /usr --buildtype release
  fi
  ninja -C _build
}

package () {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C _build install
}
