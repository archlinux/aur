# Maintainer: Christian Muehlhaeuser <muesli@gmail.com>
pkgname=kristall-git
pkgver=20210204
pkgrel=1
pkgdesc="A high-quality visual cross-platform gemini browser."
arch=('x86_64')
url="https://github.com/MasterQ32/kristall"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'openssl' 'qt5-svg')
provides=("kristall")
conflicts=("kristall")
source=($pkgname::git://github.com/MasterQ32/kristall.git)
sha256sums=('SKIP')

prepare() {
  # Fix desktop launcher icon name (allow per-theme override)
  sed -i 's/net.random-projects.//' "$srcdir/$pkgname"/Kristall.desktop
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -D build/kristall "$pkgdir/usr/bin/kristall"
  install -D LICENSE "$pkgdir/usr/share/licenses/kristall/LICENSE"
  install -Dm644 Kristall.desktop "$pkgdir/usr/share/applications/kristall.desktop"

  for size in 16 32 64 128; do
    install -Dm644 src/icons/kristall-$size.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kristall.png"
  done
  install -Dm644 src/icons/kristall.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kristall.svg"
}
