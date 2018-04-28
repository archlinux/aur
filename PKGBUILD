# Maintainer: aksr <aksr at t-com dot me>
pkgname=lackey-git
pkgver=r84.f3ee8b7
pkgrel=1
epoch=
pkgdesc="A lightweight terminal based calendar program."
arch=('i686' 'x86_64')
url="https://github.com/Andy753421/lackey"
license=('GPLv3')
categories=()
groups=()
depends=('ncurses' 'libical')
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
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make CPPFLAGS+="-Isrc" LDFLAGS+="-lncursesw -lical"
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -D -m644 doc/screen.txt $pkgdir/usr/share/doc/${pkgname%-*}/screen.txt
  install -D -m644 doc/edit.txt $pkgdir/usr/share/doc/${pkgname%-*}/edit.txt
  install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

