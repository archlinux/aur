# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>

pkgname=devilutionx-git
pkgver=1.2.1.r2128.06801789e
pkgrel=1
pkgdesc="Diablo devolved for linux (git version)"
arch=('x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('fmt' 'libpng' 'libsodium' 'sdl2')
makedepends=('git' 'cmake' 'gettext' 'smpq')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${pkgname%-git}"
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 LICENSE \
    -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
  cd build
  make install DESTDIR="${pkgdir}"
}
