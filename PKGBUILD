# Maintainer: aksr <aksr at t-com dot me>
pkgname=libregexp-git
pkgver=r18.f64437a
pkgrel=1
epoch=
pkgdesc="A Unix port of the Plan 9 regular expression library, originally done for the Inferno operating system."
arch=('i686' 'x86_64')
url="https://github.com/0intro/libregexp"
license=('custom')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/0intro/libregexp.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '28s!/man/man7!/share/man/man7!' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 NOTICE $pkgdir/usr/share/licenses/${pkgname%-*}/NOTICE
}

