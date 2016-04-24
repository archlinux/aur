# Maintainer: aksr <aksr at t-com dot me>
pkgname=loksh-git
pkgver=5.9.r19.d1eafa7
pkgrel=1
epoch=
pkgdesc="A Linux port of OpenBSD's ksh."
arch=('i686' 'x86_64')
url="https://github.com/dimkr/loksh"
license=('publicdomain')
groups=()
depends=('libbsd')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('loksh')
conflicts=('loksh')
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/dimkr/loksh.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '41d;42d;43d' Makefile
  sed -i '10a LIC_DIR ?= $(PREFIX)/share/licenses/loksh' Makefile
  sed -i '42s/-m/-D -m/;42s/DOC/LIC/' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make LDFLAGS='-lbsd'
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" BIN_NAME="loksh" install
}

