# Maintainer: Alexandre BIQUE <bique.alexandre@gmail.com>
pkgname=clap-host
pkgver=1.0
pkgrel=2
pkgdesc="CLAP host"
arch=(x86_64)
url="https://github.com/free-audio/clap-host"
license=('MIT')
groups=()
depends=(qt6-base rtmidi rtaudio)
makedepends=(cmake ninja)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/free-audio/clap-host#tag=b5db1c246c173692371a17d92c2bd5fda1826d98
  git+https://github.com/free-audio/clap#tag=55ee06f776669b94d63247a9c1dcb7dfa6056587
  git+https://github.com/free-audio/clap-helpers#tag=716cdf49cc6eb7999bad44c084b363bbde907937)
noextract=()
sha256sums=('SKIP'
  'SKIP'
  'SKIP') #autofill using updpkgsums

build() {
  cd "$pkgname"

  rm -rf clap clap-helpers
  ln -s "$srcdir/clap"
  ln -s "$srcdir/clap-helpers"

  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DUsePkgConfig=TRUE -GNinja ..
  ninja
}

package() {
  cd "$pkgname/build"

  DESTDIR="$pkgdir/" ninja install
}
