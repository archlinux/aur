# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=cv-git
pkgver=f107805
pkgrel=1
epoch=1
pkgdesc="Shows running coreutils basic commands and displays stats"
arch=('i686' 'x86_64')
url="https://github.com/Xfennec/cv"
license=('GPL3')
depends=()
makedepends=('git')
source=('git://github.com/Xfennec/cv')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i "s@/usr/local@/usr@" Makefile
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
  for _doc in capture.png README.md; do
    install -Dm 644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
}

# vim:set ts=2 sw=2 et:
