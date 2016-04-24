# Maintainer: aksr <aksr at t-com dot me>
pkgname=xplayargs-git
pkgver=r1.d4711c7
pkgrel=1
epoch=
pkgdesc="A xargs-like audio player."
arch=('i686' 'x86_64')
url="https://github.com/dimkr/xplayargs"
license=('MIT')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('xplayargs')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/dimkr/xplayargs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '24d' Makefile
  sed -i '7a LIC_DIR ?= /usr/share/licenses' Makefile
  sed -i '25s/-m/-D -m/;25s/DOC/LIC/' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" BIN_DIR="/usr/bin" install
}

