# Maintainer: aksr <aksr at t-com dot me>
pkgname=dpic-git
pkgver=r20.3073b72
pkgrel=1
epoch=
pkgdesc="An implementation of the pic \"little language,\" with support for LaTeX, PDF, SVG, Postscript, and xfig 3.2 output."
arch=('i686' 'x86_64')
url="https://gitlab.com/aplevich/dpic.git"
url="https://ece.uwaterloo.ca/~aplevich/dpic/"
license=('BSD')
categories=()
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://gitlab.com/aplevich/dpic.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/usr" install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  sed '145,171!d' README > LICENSE
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

