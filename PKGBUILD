# Maintainer: aksr <aksr at t-com dot me>
pkgname=fish-irssi-git
pkgver=223.2764141
_pkgname=irssi
_pkgver=0.8.19
pkgrel=1
pkgdesc="irssi FiSH plugin"
arch=('i686' 'x86_64')
url="https://github.com/falsovsky/FiSH-irssi"
license=('GPL')
groups=()
depends=('irssi' 'openssl' 'glib')
makedepends=('git' 'cmake')
provides=('fish-irssi')
conflicts=('fish-irssi')
replaces=()
backup=()
options=()
install=fish-irssi-git.install
source=("https://github.com/irssi/irssi/releases/download/$_pkgver/$_pkgname-$_pkgver.tar.xz"
        "$pkgname::git://github.com/falsovsky/FiSH-irssi")
noextract=()
md5sums=('98c0d15c8f752a595520d817e1cb5667'
         'SKIP')
sha1sums=('aabdc5422aa5ada067cf4d0dfdd16e4c2c2a1e53'
          'SKIP')
sha256sums=('4ca0040548e814ea93eb7d602ab7d6d379afcbbdf10e84160523ce69c73ee5d3'
            'SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  cmake -DIRSSI_PATH:PATH="$srcdir/$_pkgname-$_pkgver"
  make
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 src/libfish.so $pkgdir/usr/lib/irssi/modules/libfish.so
  install -Dm644 FiSH-irssi.txt $pkgdir/usr/share/doc/$pkgname/FiSH-irssi.txt
}

