# Maintainer: aksr <aksr at t-com dot me>
pkgname=hp-git
pkgver=r21.5b743b7
pkgrel=1
epoch=
pkgdesc="Modern version of the GT SWT \"hp\" RPN calculator"
arch=('i686' 'x86_64')
url="https://github.com/arnoldrobbins/hp"
license=('GPL3')
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
  mkdir -p $pkgdir/usr/{bin,share/{doc,man/man1}}
  install -D -m755 hp $pkgdir/usr/bin/hp
  install -D -m755 hp.awk $pkgdir/usr/bin/hp.awk
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -D -m644 hp.1 $pkgdir/usr/share/man/man1/hp.1
}

