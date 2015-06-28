# Maintainer: aksr <aksr at t-com dot me>
pkgname=mpq-tools-git
pkgver=0.4.2.r6.g5e04164
pkgrel=1
epoch=
pkgdesc="A set of utilities for manipulating MPQ (MoPaQ) archives, which are used by Blizzard in most of their games."
arch=('i686' 'x86_64')
url="https://github.com/mbroemme/mpq-tools"
license=('GPLv2')
groups=()
depends=('glibc' 'libmpq')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!libtool')
changelog=
install=
source=("$pkgname::git+https://github.com/mbroemme/mpq-tools.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/^.*tools-//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  export PYTHON=python2
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

