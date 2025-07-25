# Maintainer: Justin Gassner <justin.gassner@mailbox.org>

pkgname=sxot
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple X11 screenshot tool"
arch=('x86_64')
url="https://codeberg.org/NRK/$pkgname"
license=('GPL-3.0-or-later')
depends=('libx11' 'libxfixes')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('84f1545471caf7e1de0fd92f6a100ac410596d6e5b8254389dd5c6f621624c33')

build() {
  cd "$pkgname"

  export CC="${CC:-gcc}"
  ${CC} -o $pkgname $pkgname.c ${CFLAGS} ${LDFLAGS} -s -l X11 -l Xfixes
}

package() {
  cd "$pkgname"

  install -Dm755 $pkgname -t "$pkgdir/usr/bin/"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
