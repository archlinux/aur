# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
pkgname=astroid
pkgver=0.12
pkgrel=1
epoch=
pkgdesc="a graphical threads-with-tags style, lightweight and fast, email client for notmuch, inspired by sup and others"
arch=('x86_64' 'i686')
url="https://github.com/astroidmail/astroid"
license=('GPL')
groups=()
depends=('notmuch' 'boost' 'boost-libs' 'gmime' 'gtkmm3' 'webkitgtk' 'libsass' 'libpeas' 'gobject-introspection')
makedepends=('cmake' 'ninja' 'git' 'pkg-config' 'python-gobject' 'marked')
checkdepends=('notmuch-runtime')
optdepends=('gvim: default editor'
            'emacs: can be used as editor'
            'vte3: for drop-down terminal')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=($pkgname-v$pkgver.tar.gz::https://github.com/astroidmail/astroid/archive/v${pkgver}.tar.gz)
noextract=()
sha256sums=('27d30309f1ccaa7b0374abf3a5ad3ee223820e511aa63c5afc2970fc87555183')

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

