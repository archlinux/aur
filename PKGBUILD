# Maintainer: aksr <aksr at t-com dot me>
pkgname=fish-irssi-git
pkgver=266.8418ac3
_pkgname=irssi
_pkgver=1.1.1
pkgrel=1
pkgdesc="irssi FiSH plugin"
arch=('i686' 'x86_64')
url="https://github.com/falsovsky/FiSH-irssi"
license=('GPL')
groups=()
depends=('irssi' 'openssl' 'glib2')
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
md5sums=('1eb33d621c163827ee076f5c8ca2b5ee'
         'SKIP')
sha1sums=('a6f984daf5fbf9db07a431b7a4a05fec15cc3c3a'
          'SKIP')
sha256sums=('784807e7a1ba25212347f03e4287cff9d0659f076edfb2c6b20928021d75a1bf'
            'SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  cmake -DIRSSI_INCLUDE_DIR:PATH="$srcdir/$_pkgname-$_pkgver" \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 src/libfish.so $pkgdir/usr/lib/irssi/modules/libfish.so
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}

