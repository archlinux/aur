# maintainer: aray4iv3 <aray.4iv3@gmail.com>
pkgname=smosummary
pkgver=4.0.1
pkgrel=1
pkgdesc="A Sum of Best (SoB) calculator and Stopwatch for Super Mario Odyssey speedrunners"
arch=('x86_64')
url="https://github.com/aray4iv3/smosummary"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'gcc') # CMake is now the captain

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=('smosummary')
conflicts=('smosummary-bin' 'smosummary-git')

build() {
  cd "$srcdir/$pkgname"
  # hopyfully build directory doesn't fail, but i trust cmake unlike cargo
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  # compileeeeeeeeeeeeeeeeeeeeeee
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  # /usr/bin moment
  install -Dm755 build/smosummary "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
