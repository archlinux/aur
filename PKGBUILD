# Maintainer: aksr <aksr at t-com dot me>
pkgname=fish-irssi-git
pkgver=168.b05763c
_pkgname=irssi
_pkgver=0.8.17
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
source=("http://irssi.org/files/$_pkgname-$_pkgver.tar.bz2"
        "$pkgname::git://github.com/falsovsky/FiSH-irssi")
noextract=()
md5sums=('ecf64be47978d89a742b435a81cb47db'
         'SKIP')
sha1sums=('3bdee9a1c1f3e99673143c275d2c40275136664a'
          'SKIP')
sha256sums=('3c9600cad2edf58f1d012febc1a0ba844274df6e331c01a9e935467705166807'
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

