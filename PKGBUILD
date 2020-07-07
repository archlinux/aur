# Maintainer: Simon Cruanes <simon.cruanes.2007@m4x.org>
pkgname=kristall
pkgver=0.3
pkgrel=0
pkgdesc="A high-quality visual cross-platform gemini browser."
arch=('x86_64')
url="https://github.com/MasterQ32/kristall"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'openssl' 'qt5-svg')
source=("https://github.com/MasterQ32/kristall/archive/V0.3.tar.gz")
b2sums=('3e00243cf455ad810e8d51333b63186e637de1c292a116dbb4273825c51b1c1bf1921bfd243acb97e13dc201b3dcce7240f3c66368b66b607e5c207a2d901934')

prepare() {
  # Fix desktop launcher icon name (allow per-theme override)
  sed -i 's/net.random-projects.//' $pkgname-$pkgver/Kristall.desktop
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver

  install -D build/kristall "$pkgdir/usr/bin/kristall"
  install -D LICENSE "$pkgdir/usr/share/licenses/kristall/LICENSE"
  install -Dm644 Kristall.desktop "$pkgdir/usr/share/applications/kristall.desktop"

  for size in 16 32 64 128; do
    install -Dm644 src/icons/kristall-$size.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kristall.png"
  done
  install -Dm644 src/icons/kristall.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kristall.svg"
}

