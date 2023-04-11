# Maintainer: robertfoster

pkgname=devilutionx-mpq-tools-git
pkgver=1
pkgrel=1
pkgdesc="DevilutionX MPQ minifier tool (git version)"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionx-mpq-tools"
license=('custom:unlicense')
depends=('fmt')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

build() {
  cd "${pkgname%-git}"

  cmake -S. -Bbuild-rel -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr"

  cmake --build build-rel -j "$(getconf _NPROCESSORS_ONLN)"
}

package() {
  cd "${pkgname%-git}"
  DESTDIR="${pkgdir}" \
    cmake --install build-rel
}
