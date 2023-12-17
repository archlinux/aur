# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrew LeCain dread@csh.rit.edu

pkgname=screen-message
pkgver=0.28
pkgrel=1
pkgdesc="Displays a short text fullscreen as large and as quickly as possible."
arch=('i686' 'x86_64')
url="http://www.joachim-breitner.de/projects"
license=('GPL')
depends=('gtk3')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nomeata/screen-message/archive/refs/tags/0.28.tar.gz")
sha256sums=('4c21104968e624a2d73c8fb188b9f9db21c7fa43bbdef8fd0880b277baf01e71')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # install to /usr/bin
  sed -i "s|/games|/bin|g" Makefile.*

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
