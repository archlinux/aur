pkgname=auralux-visualizer-git
pkgver=r8.8ead45c
pkgrel=2
pkgdesc="Visualizer for the Auralux strategy game"
arch=('any')
url="https://github.com/skorja/AuraluxVisualizer"
license=('MIT')
depends=('qt5-base')
source=("$pkgname"::'git+https://github.com/skorja/AuraluxVisualizer.git' 'auralux-visualizer-config' 'auralux-visualizer')
sha256sums=('SKIP' 'e95a9e7ec253da4510ce68224d4896c99f21d0fdac99349d39bb630aedb5e2ee' 'f4b42c9f7853534a159c1f27ac55b4e719bc1d2bc15d66f8298c4f447f0cc76a')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  qmake ..
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/build/Auralux_visual" "$pkgdir/usr/share/$pkgname/auralux-visualizer"
  install -Dm755 "$srcdir/$pkgname/build/main.o" "$pkgdir/usr/share/$pkgname/main.o"
  install -Dm755 "$srcdir/$pkgname/build/mainwindow.o" "$pkgdir/usr/share/$pkgname/mainwindow.o"
  install -Dm755 "$srcdir/$pkgname/build/moc_mainwindow.o" "$pkgdir/usr/share/$pkgname/moc_mainwindow.o"
  install -Dm644 "$srcdir/$pkgname/viz.conf" "$pkgdir/etc/$pkgname/viz.conf"
  install -Dm755 "$srcdir/auralux-visualizer-config" "$pkgdir/usr/bin/auralux-visualizer-config"
  install -Dm755 "$srcdir/auralux-visualizer" "$pkgdir/usr/bin/auralux-visualizer"
  ln -s "/etc/$pkgname/viz.conf" "$pkgdir/usr/share/$pkgname/viz.conf"
}
