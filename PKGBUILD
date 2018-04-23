# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: chochem <chochem@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mcplay
pkgver=0.3j
pkgrel=4
epoch=
pkgdesc="A ncurses audio player."
arch=('i686' 'x86_64')
url="http://www.yahuxo.de/mcplay/"
license=('GPL')
groups=()
depends=('glib2' 'ncurses' 'mpg123' 'sox')
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.yahuxo.de/$pkgname/$pkgname-$pkgver.tar.gz"
        'mcplay.patch'
        'remote.patch'
        'config.patch')
noextract=()
options=()
md5sums=('5d898c11da789d8beaa3fbdd2a21e238'
         'b4b865df9897e76442dcc7182d05fe6e'
         '7307195fe0513472156f55dfa50247d7'
         '4fd0d31cceb27ed9dae890afd8d90ab5')
sha1sums=('42baed9a8627e304205a24d5486e7ffb066b4d51'
          'b941265146f274f3177d5924f548da8c4176801a'
          '207b97de49626f29ee671944e6ab052b190006b8'
          '3e37c55d2534938e40c528a1e428bf56d2a0dfd2')
sha256sums=('d4840896dc78a1721b6f66112c0d7adfb7d81168d7a03aa6bd314484437e821e'
            'e6a7db4f6b75ef99a1b1e36a814899b4e280a6648b02f0a2e82d5a43b853e862'
            '61d782dc8478e016409f74d3e303ea46fbce0e62acfd9bf6f5027ab572eb6c16'
            '1def176b32a44eeb9fa334c9d1b4ae1abe239aa850e9d979eb9af820edaf958c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch < ../mcplay.patch
  patch < ../remote.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  patch < ../config.patch
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

