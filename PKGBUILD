# Maintainer: aksr <aksr at t-com dot me>
pkgname=bgrep-git
pkgver=0.2.r86.g4401646
pkgrel=2
epoch=
pkgdesc="Binary Grep"
arch=('i686' 'x86_64')
url="https://github.com/rsharo/bgrep"
license=('BSD')
categories=()
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('bgrep')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/rsharo/bgrep.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^bgrep.//'
}

build() {
  cd "$srcdir/$pkgname"
  ./remove_cruft.sh
  ./bootstrap
  ./configure
  make
}

check() {
  cd "$srcdir/$pkgname/test"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" prefix="/usr" install
}

