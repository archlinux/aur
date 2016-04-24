# Maintainer: aksr <aksr at t-com dot me>
pkgname=luufs-git
pkgver=0.1.r39.bced352
pkgrel=1
epoch=
pkgdesc="A lazy man's, user-mode union file system."
arch=('i686' 'x86_64')
url="https://github.com/dimkr/luufs"
license=('MIT')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('luufs')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/dimkr/luufs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '70d' Makefile
  sed -i '31a LIC_DIR ?= usr/share/licenses/luufs' Makefile
  sed -i '71s/-m/-D -m/;71s/DOC/LIC/' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" SBIN_DIR="/usr/bin/" install
}

