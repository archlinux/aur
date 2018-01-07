# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=qps
pkgver=1.10.16
pkgrel=5
pkgdesc="a visual process manager, an X11 version of 'top' or 'ps'."
url="https://github.com/QtDesktop/qps"
depends=('qt5-base' 'qt5-x11extras')
makedepends=('cmake')
arch=('x86_64')
license=("GPL")
source=("$pkgname-$pkgver.tar.gz::https://github.com/QtDesktop/qps/archive/v$pkgver.tar.gz"
	"qps.desktop")
sha256sums=('09015e066c555821c8d7bdcec26bf8d9e0130431664625533b44a73a8de4101f'
            '5216455ce5ce096b36f1b301325fd44c972ff796aa3b40b60807a06dae0ab3f9')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cmake .
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -D -m 755 src/qps "$pkgdir"/usr/bin/qps
  install -D -m 644 qps.1 "$pkgdir"/usr/share/man/man1/qps.1
  install -D -m 644 "$srcdir"/qps.desktop "$pkgdir"/usr/share/applications/qps.desktop
  install -D -m 644 icon/icon.xpm "$pkgdir"/usr/share/pixmaps/qps.xpm
}
