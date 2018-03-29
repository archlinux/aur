# Maintainer: aksr <aksr at t-com dot me>
pkgname=teximpatient-git
pkgver=r29.e3666ab
pkgrel=1
epoch=
pkgdesc="TeX for the Impatient is a ~350 page book on TeX, plain TeX, and Eplain, written by Paul Abrahams, Kathryn Hargreaves, and Karl Berry. "
arch=('any')
url="http://git.savannah.gnu.org/cgit/teximpatient.git"
url="http://savannah.gnu.org/projects/teximpatient/"
license=('GFDLv1.3' 'FDL')
categories=()
groups=()
depends=('')
makedepends=('git' 'texlive-core' 'icon')
optdepends=()
checkdepends=()
provides=()
conflicts=(${pkgname%-*})
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://git.savannah.gnu.org/git/teximpatient.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/${pkgname%-*}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname/${pkgname%-*}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 errata.future $pkgdir/usr/share/doc/${pkgname%-*}/errata.future
}

