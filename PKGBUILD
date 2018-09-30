# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
pkgname=astroid
pkgver=0.14
pkgrel=1
epoch=
pkgdesc="a graphical threads-with-tags style, lightweight and fast, email client for notmuch, inspired by sup and others"
arch=('x86_64' 'i686')
url="https://github.com/astroidmail/astroid"
license=('GPL')
groups=()
depends=('notmuch' 'boost' 'boost-libs' 'gmime' 'gtkmm3' 'webkit2gtk' 'libsass' 'libpeas' 'gobject-introspection' 'protobuf')
makedepends=('cmake' 'ninja' 'git' 'pkg-config' 'python-gobject' 'cmark' 'ruby-ronn')
checkdepends=('notmuch-runtime')
optdepends=('gvim: default editor'
            'emacs: can be used as editor'
            'vte3: for drop-down terminal'
            'cmark: for markdown to html composition')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=($pkgname-v$pkgver.tar.gz::https://github.com/astroidmail/astroid/archive/v${pkgver}.tar.gz)
noextract=()
sha256sums=('f2642968919527008d383b4c32d4b038c7b6f785ea084dde1222a65162ebc5ca')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cd build
  ctest --output-on-failure
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cd build
  DESTDIR="$pkgdir" ninja install
}

