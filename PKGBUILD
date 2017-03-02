# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
_pkgname=astroid
pkgname=$_pkgname-git
pkgver=v0.7.r56.ge4c070d
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

