# Maintainer: aksr <aksr at t-com dot me>
pkgname=fish-irssi-git
pkgver=266.8418ac3
pkgrel=2
pkgdesc="irssi FiSH plugin"
arch=('i686' 'x86_64')
url="https://github.com/falsovsky/FiSH-irssi"
license=('GPL')
groups=()
depends=('irssi' 'openssl' 'glib2')
makedepends=('git' 'cmake' 'irssi')
provides=('fish-irssi')
conflicts=('fish-irssi')
replaces=()
backup=()
options=()
install=fish-irssi-git.install
source=("$pkgname::git://github.com/falsovsky/FiSH-irssi")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 src/libfish.so $pkgdir/usr/lib/irssi/modules/libfish.so
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}

