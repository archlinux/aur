# Maintainer: aksr <aksr at t-com dot me>
pkgname=9menu-git
pkgver=r32.d6285c9
pkgrel=1
epoch=
pkgdesc="Simple X11 menu program for running commands"
arch=('i686' 'x86_64')
url="https://github.com/arnoldrobbins/9menu"
license=('custom')
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
  make DESTDIR="$pkgdir/" BINDIR="/usr/bin" install
  install -D -m644 9menu.1 $pkgdir/usr/share/man/man1/9menu.1
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  sed '22,37!d' README > LICENSE
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

