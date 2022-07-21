# Maintainer: nullium21 <rommyskovets@gmail.com>
pkgname=entt-git
pkgver=3.10.0.r265.e8f85202
pkgrel=1
pkgdesc="A header-only, tiny and easy to use entity-component system (and much more) written in modern C++"
arch=('any')
url="https://skypjack.github.io/entt/"
license=('MIT')
makedepends=(git cmake)
checkdepends=()
optdepends=()
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/skypjack/entt")
sha256sums=(SKIP)
noextract=()
validpgpkeys=()

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf '%s' $(git describe --long --tags | sed 's/^[^0-9]//;s/\([^-]*-\)g/r\1/;s/-/./g')
}

build() {
  cmake -B build -S "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENTT_BUILD_TESTING=OFF \
        -DENTT_USE_LIBCPP=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  mkdir -p "$pkgdir"/usr/share/licenses/${pkgname%-git}
  install "$srcdir/${pkgname%-git}"/LICENSE $pkgdir/usr/share/licenses/${pkgname%-git}
}
