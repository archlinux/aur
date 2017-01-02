# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
pkgname=astroid-git
pkgver=v0.7.r0.g10a1f7a
pkgrel=1
epoch=
pkgdesc="a graphical threads-with-tags style, lightweight and fast, email client for notmuch, inspired by sup and others"
arch=('x86_64' 'i686')
url="https://github.com/astroidmail/astroid"
license=('GPL')
groups=()
depends=('notmuch' 'boost' 'boost-libs' 'gmime' 'gtkmm3' 'webkitgtk' 'libsass' 'libpeas' 'gobject-introspection')
makedepends=('scons' 'git' 'pkg-config' 'python-gobject')
checkdepends=('notmuch-runtime')
optdepends=('gvim: default editor'
            'emacs: can be used as editor')
provides=('astroid')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(astroid::git+https://github.com/astroidmail/astroid.git)
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir/astroid"
  scons --release="$pkgver" --prefix=/usr build
}

check() {
  cd "$srcdir/astroid"
  scons --release="$pkgver" --prefix=/usr test
}

package() {
  cd "$srcdir/astroid"
  scons --release="$pkgver" --install-sandbox="$pkgdir/" --prefix=/usr install
}

pkgver() {
  cd "astroid"
  git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

