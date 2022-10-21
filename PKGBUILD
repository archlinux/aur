# Maintainer: Alexandre BIQUE <bique.alexandre@gmail.com>
pkgname=clap-plugins
pkgver=1.0.1
pkgrel=1
pkgdesc="CLAP example plugins"
arch=(x86_64)
url="https://github.com/free-audio/clap-plugins"
license=('MIT')
groups=()
depends=(qt6-base qt6-declarative)
makedepends=(cmake ninja git catch2)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/free-audio/clap-plugins#tag=$pkgver
  git+https://github.com/free-audio/clap#branch=main
  git+https://github.com/free-audio/clap-helpers#branch=main
  git+https://github.com/niXman/yas#branch=master)
noextract=()
sha256sums=(SKIP
  SKIP
  SKIP
  SKIP)

build() {
  cd "$pkgname"

  rm -rf clap clap-helpers vcpkg yas

  ln -s "$srcdir/clap"
  ln -s "$srcdir/clap-helpers"
  ln -s "$srcdir/yas"

  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCLAP_PLUGINS_REMOTE_GUI=TRUE -DCLAP_PLUGINS_EMBED_QML=TRUE -GNinja ..
  ninja
}

package() {
  cd "$pkgname/build"

  DESTDIR="$pkgdir/" ninja install
}
