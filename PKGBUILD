# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
pkgname=astroid
pkgver=v0.5.r101.g3fdc0b2
pkgrel=1
epoch=
pkgdesc="a graphical threads-with-tags style, lightweight and fast, email client for notmuch, inspired by sup and others"
arch=('x86_64' 'i686')
url="https://github.com/gauteh/astroid"
license=('GPL')
groups=()
depends=('notmuch' 'boost' 'boost-libs' 'gmime' 'gtkmm3' 'webkitgtk' 'libsass' 'libpeas')
makedepends=('scons' 'git' 'pkg-config')
checkdepends=('notmuch-runtime')
optdepends=('gvim: default editor'
            'emacs: can be used as editor')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(astroid::git+https://github.com/gauteh/astroid.git)
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  scons --release="$pkgver" --prefix=/usr build
}

check() {
  cd "$srcdir/$pkgname"
  scons --release="$pkgver" --prefix=/usr test
}

package() {
  cd "$srcdir/$pkgname"
  scons --release="$pkgver" --install-sandbox="$pkgdir/" --prefix=/usr install
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

