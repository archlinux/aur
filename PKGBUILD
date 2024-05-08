# Maintainer: Nikl <nikl174@mailbox.org>
pkgname=colord-brightness
pkgver=1.0.1
pkgrel=1
pkgdesc="Adjust Display brightness with icc-profiles using the colord-daemon"
arch=("any")
url="https://github.com/Nikl174/colord-brightness"
license=('GPL')
groups=()
depends=(
  "colord"
  "lcms2"
  )
makedepends=(
  "cmake"
  "easyloggingpp"
  "pkgconf"
  )
options=()
#https://github.com/Nikl174/colord-brightness/archive/refs/tags/1.0.0.tar.gz
source=("https://github.com/Nikl174/$pkgname/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('fc7006b47f2494503e6a08660eff582e8f87f2269f173aa205fe423d4689de4f')

build() {
  cd "$pkgname-$pkgver"
  mkdir build && cd build || cd build

  cmake -D CMAKE_BUILD_TYPE="None" -Wno-dev ..
  make
}

check() {
  cd "$pkgname-$pkgver"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$pkgname-$pkgver"

  cmake --install build/ --config Release --prefix="$pkgdir/"
}
