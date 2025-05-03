# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrew LeCain dread@csh.rit.edu

pkgname=screen-message
pkgver=0.29
pkgrel=1
pkgdesc="Displays a short text fullscreen as large and as quickly as possible."
arch=('i686' 'x86_64')
url="http://www.joachim-breitner.de/projects"
license=('GPL')
depends=('gtk3')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nomeata/screen-message/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('27c7409336a65af3b4ef8a0e8c76a0c9ee9b0db8b5fe6b6e0dfb9d28700c5079')

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
