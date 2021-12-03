# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>

pkgname=devilutionx-git
pkgver=1.3.0.r318.da837c4d2
pkgrel=1
pkgdesc="Diablo devolved for linux (git version)"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('bzip2' 'fmt' 'libpng' 'libsodium' 'sdl2' 'sdl2_image' 'zlib')
makedepends=('git' 'cmake' 'gettext' 'smpq')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${pkgname%-git}"
  if [ ! -d build ]; then
	mkdir build
  fi
}
build() {
  cd "${pkgname%-git}/build"
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
