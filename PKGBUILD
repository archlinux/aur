# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
_pkgname=astroid
pkgname=$_pkgname-git
pkgver=v0.13.r21.g00a1fbb
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
            'vte3: for drop-down terminal')
provides=('astroid')
conflicts=()
replaces=()
backup=()
options=()
install=$_pkgname.install
changelog=
source=(astroid::git+https://github.com/astroidmail/astroid.git)
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir/astroid"
  mkdir -p build
  cd build
  cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd "$srcdir/astroid"
  cd build
  ctest --output-on-failure
}

package() {
  cd "$srcdir/astroid"
  cd build
  DESTDIR="$pkgdir" ninja install
}

pkgver() {
  cd "astroid"
  git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

