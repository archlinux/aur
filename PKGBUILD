# Maintainer: Wisker <TheWisker@protonmail.com>
pkgname=emath
pkgbase=emath
pkgver=2.2.0
pkgrel=2
pkgdesc="Library for representing and operating abstract algebraic concepts"
arch=('x86_64')
url="https://github.com/TheWisker/EMath"
license=('GPL')
groups=()
depends=('ncurses' 'rapidjson' 'sfml' 'gcc' 'glibc')
makedepends=('meson' 'ninja' 'git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('usr/bin/polynomials.json')
options=()
install=
changelog=
source=('git+https://github.com/TheWisker/EMath')
noextract=()
sha256sums=('SKIP')

prepare() {
  mkdir "$srcdir/EMath/bin"
  cd "$srcdir/EMath"
  git submodule init && git submodule update
  meson setup --prefix="/usr" --bindir="/usr/bin" --includedir="/usr/include" --libdir="/usr/lib" --backend=ninja --buildtype=release --default-library=shared --optimization=3 --warnlevel=0 ./bin
}

build() {
  cd "$srcdir/EMath/bin"
  meson compile
}

check() {
  cd "$srcdir/EMath/bin"
  meson test -v
}

package() {
  cd "$srcdir/EMath/bin"
  meson install --destdir "$pkgdir/" --no-rebuild --strip
  echo "" > "$pkgdir/usr/bin/polynomials.json"
}
