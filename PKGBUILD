# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qliquidsfz-git
_pkgname=qliquidsfz
pkgver=0.1.3r0.g7c37fc9
pkgrel=1
pkgdesc="Simple LiquidSFZ synthesizer GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qliquidsfz"
license=('GPL')
depends=('jack' 'liquidsfz' 'qt5-base')
#conflicts=('qliquidsfz')
source=("$pkgname::git+https://github.com/be1/$_pkgname")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  qmake PREFIX=/usr -config release
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 qliquidsfz $pkgdir/usr/bin/qliquidsfz
  install -Dm644 qliquidsfz.png $pkgdir/usr/share/pixmaps/qliquidsfz.png
  install -Dm644 qliquidsfz.desktop $pkgdir/usr/share/applications/qliquidsfz.desktop
}

# vim:set ts=2 sw=2 et:
