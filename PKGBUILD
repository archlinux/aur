# Author: Sébastien Lacroix <erufu.sennin@gmail.com>
# Maintainer: Lars Hupel <lars@hupel.info>
pkgname=qpdfpresenterconsole
pkgver=2.5.13
pkgrel=3
pkgdesc="A Keynote-like presentation tool for PDF (e.g. beamer)"
arch=('i686' 'x86_64')
url="https://gitlab.com/qpdfpresenterconsole/qpdfpresenterconsole"
license=('custom')
makedepends=('cmake' 'asciidoc')
depends=('poppler-qt' 'vlc' 'qtwebkit')
source=("v$pkgver.tar.gz::https://gitlab.com/qpdfpresenterconsole/qpdfpresenterconsole/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('3655003efec1c8a4b09795d893612d2bd650991399fb256b761352bdb22929ed')

_git_hash='2dc5d67f7d3d916978e0207936e6711334d273c7'

build() {
  cd "$srcdir/$pkgname-v$pkgver-$_git_hash"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-$_git_hash/build"
  make DESTDIR="$pkgdir/" install

  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 "$srcdir/$pkgname-v$pkgver-$_git_hash/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

post_install() {
  update-desktop-database -q
}
