# Maintainer: Justin Gassner <justin.gassner@mailbox.org>

pkgname=selx
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimal X11 selection tool"
arch=('x86_64')
url="https://codeberg.org/NRK/$pkgname"
license=('GPL-3.0-or-later')
depends=('libx11' 'libxext' 'libxrandr')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a21d228da8c7ec9dc22219ec57a81c1a8dfc16140a443f98361fbedbc0cc9be0')

build() {
  cd "$pkgname"

  export CC="${CC:-gcc}"
  ${CC} -o $pkgname $pkgname.c ${CFLAGS} ${LDFLAGS} -s -l X11 -l Xext -l Xrandr
}

package() {
  cd "$pkgname"

  install -Dm755 $pkgname -t "$pkgdir/usr/bin/"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 $pkgname.1 -t "$pkgdir/usr/share/man/man1/"
}
