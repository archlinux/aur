# Maintainer: hossbeast <todd DOT freed AT gmail DOT com>

pkgname=meshboard-xorg
pkgver=0.5.5
pkgrel=1
pkgdesc="Synchronize the clipboard across a mesh of hosts, with xorg integration"
provides=('meshboard')
conflicts=('meshboard')
arch=('x86_64')
url="https://git.sr.ht/~hossbeast/meshboard"
license=('GPL3')
depends=('libxfixes')
makedepends=('git' 'perl')
source=(
  "meshboard::git+https://git.sr.ht/~hossbeast/meshboard#tag=v${pkgver}?signed"
)
sha512sums=('SKIP')
validpgpkeys=('79154EE9C4811D32B814EB88B1B3C76D76638462') # hossbeast

build() {
  cd meshboard
  ./configure --enable-xorg
  make
}

package() {
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/meshboard/meshboard"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/meshboard/mb-copy"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/meshboard/mb-paste"

  install -m755 -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/meshboard/README.md"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/meshboard/CHANGELOG"

  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/meshboard/LICENSE"

  install -m755 -d "$pkgdir/usr/lib/systemd/user"
  install -m644 -t "$pkgdir/usr/lib/systemd/user" "$srcdir/meshboard/contrib/systemd/meshboard.service"
}
