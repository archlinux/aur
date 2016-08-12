# Maintainer: aksr <aksr at t-com dot me>
pkgname=sam-git
pkgver=r110.66c9497
pkgrel=1
epoch=
pkgdesc="An updated version of the sam text editor."
arch=('i686' 'x86_64')
url="https://github.com/deadpixi/sam"
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
source=("$pkgname::git+https://github.com/deadpixi/sam.git")
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
  make DESTDIR="$pkgdir/usr" install
  install -Dm644 README.rst $pkgdir/usr/share/doc/${pkgname%-*}/README.rst
  install -Dm644 doc/sam.ps $pkgdir/usr/share/doc/${pkgname%-*}/sam.ps
  install -Dm644 doc/se.ps $pkgdir/usr/share/doc/${pkgname%-*}/se.ps
  install -Dm644 doc/keyboard $pkgdir/usr/share/doc/${pkgname%-*}/sample/keyboard
  install -Dm644 doc/keyboard.5 $pkgdir/usr/share/man/man5/keyboard.5
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

