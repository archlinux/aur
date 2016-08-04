# Maintainer: aksr <aksr at t-com dot me>
pkgname=socketpipe-git
pkgver=r40.b26bc35
pkgrel=1
epoch=
pkgdesc="Super efficient TCP connection between remote processes"
arch=('i686' 'x86_64')
url="https://github.com/dspinellis/socketpipe"
url="http://www.spinellis.gr/sw/unix/socketpipe"
license=('MIT')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('socketpipe')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/dspinellis/socketpipe.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '14s!/man/!/share&!' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,share/man/man1}/
  make PREFIX="$pkgdir/usr" install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

