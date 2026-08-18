# Maintainer: Guilherme leonsombrio244@gmain.com
pkgname=organise-git
pkgver=1.0.0.r0.g1234567
pkgrel=1
pkgdesc="Automatically sort and move files into designated directories (Git version)"
arch=('x86_64')
url="https://github.com/rafael-hacker/organise"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'nlohmann-json' 'git')
provides=('organise')
conflicts=('organise')
source=("git+https://github.com/rafael-hacker/organise.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/organise"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${srcdir}/organise" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/organise/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
