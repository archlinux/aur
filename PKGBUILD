# Maintainer: Ramiro Santa Ana Anguiano <hi@colima.press>

pkgname=metamath-git
pkgver=r265.7ee8e71
pkgrel=1
pkgdesc='A simple and flexible computer-processable language that supports rigorously verifying, archiving, and presenting mathematical proofs.'
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/metamath/metamath-exe"
license=('GPL-2.0')
makedepends=('git' 'autoconf' 'make')
provides=("metamath")
conflicts=("metamath")
source=('metamath-git::git+https://github.com/metamath/metamath-exe.git')
md5sums=('SKIP')
options=('!debug')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
