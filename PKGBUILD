# Maintainer: Alexandre BIQUE <bique.alexandre@gmail.com>
pkgname=clap-plugins
pkgver=1.0
pkgrel=1
pkgdesc="CLAP example plugins"
arch=(x86_64)
url="https://github.com/free-audio/clap-plugins"
license=('MIT')
groups=()
depends=(qt6-base qt6-declarative)
makedepends=(cmake ninja)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/free-audio/clap-plugins#tag=895a34f72c659b75487562f2f67e8b2ecf41c4d1
  git+https://github.com/free-audio/clap#tag=55ee06f776669b94d63247a9c1dcb7dfa6056587
  git+https://github.com/free-audio/clap-helpers#tag=716cdf49cc6eb7999bad44c084b363bbde907937
  git+https://github.com/niXman/yas#tag=b1d0519a2d2d52beb4f6b253f0b30f742116cbcb)
noextract=()
sha256sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP') #autofill using updpkgsums

build() {
  cd "$pkgname"

  rm -rf clap clap-helpers yas
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
