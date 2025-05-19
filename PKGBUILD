# Maintainer: Jah Way <jahway603 at tutanota dot de>
# Contributor: Arno Renevier <arno@renevier.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=qiv
pkgver=3.0.2
pkgrel=2
pkgdesc='Quick Image Viewer (qiv) is a very small and fast GDK/Imlib image viewer'
arch=('x86_64')
url='https://codeberg.org/ciberandy/qiv/'
license=('GPL2')
depends=('file' 'gtk3' 'gdk-pixbuf2' 'libexif' 'lcms2' 'desktop-file-utils')
source=("$url/archive/v$pkgver.zip")
sha512sums=('e93d03d11663b278aff1ad8a64e31d4bad67dd9988d8134dd76656ed76cada7e19353f251e00facf146bd4aa952c416fc5a4beb6cecaf960f593ad443fbeaf71')

build() {
  cd "$srcdir/$pkgname"
  sed -i "s|^PREFIX = .*|PREFIX = /usr|" Makefile
  sed -i "s|\./qiv|echo &|" Makefile  # nuke test
  sed -i "s|)/man/|)/share/man/|" Makefile
  make
}

package() {
  cd "$srcdir/$pkgname"
  sed -i "s|^PREFIX = .*|PREFIX = $pkgdir/usr|" Makefile
  make COMPRESS_PROG="gzip -9nf" install

  install -D -m 0644 README "$pkgdir/usr/share/doc/qiv/README"
  install -d "$pkgdir/usr/share/doc/qiv/contrib"
  cp contrib/* "$pkgdir/usr/share/doc/qiv/contrib"
}
