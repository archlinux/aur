# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=python-pycangjie
pkgver=1.2
pkgrel=1
pkgdesc="This is a Python wrapper to libcangjie, the library implementing Cangjie and Quick input methods."
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/pycangjie/"
license=('LGPL3')
depends=('libcangjie' 'python>=3.2')
makedepends=('cython>=0.17' 'autoconf' 'automake')
replaces=('pycangjie-git')
sha256sums=('bc9115904f65581a11e43044c83e999e583468d1bb98c04b33ea059205e07c10'
'SKIP')
source=("https://github.com/Cangjians/pycangjie/releases/download/v$pkgver/cangjie-$pkgver.tar.xz" "https://github.com/Cangjians/pycangjie/commit/361bb413203fd43bab624d98edf6f7d20ce6bfd3.patch")


check() {
  cd "$srcdir/cangjie-$pkgver"
  make check
}

prepare() {
  cd "$srcdir/cangjie-$pkgver"
  patch -p1 -i "../361bb413203fd43bab624d98edf6f7d20ce6bfd3.patch"
}

build() {
  cd "$srcdir/cangjie-$pkgver"
#  ./configure --prefix=/usr
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/cangjie-$pkgver"
  make DESTDIR="$pkgdir/" install
}
