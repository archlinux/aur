# Maintainer: aksr <aksr at t-com dot me>
pkgname=grconv-git
pkgver=r117.eb4c7b3
pkgrel=1
epoch=
pkgdesc="Greek character set converter"
arch=('i686' 'x86_64')
url="https://github.com/dspinellis/grconv"
license=('ISC')
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
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man/man1" install
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

