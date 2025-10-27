# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=adbmanager
pkgver=3.9
pkgrel=1
pkgdesc="ADB manager for Android devices"
arch=('x86_64')
url="https://github.com/AKotov-dev/adbmanager"
license=('GPL-3.0-or-later')
depends=('graphicsmagick' 'android-tools' 'gtk2' 'iproute2' 'nmap' 'sakura' '7zip')
makedepends=('lazarus')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")
sha256sums=('a550973cdbd64444b73eef2e3fbe0d6ac74aa34589ecc8f5ee1579e1ed3ac8a9'
            'dfcea6314f6c08ae8efad0503f15669c20e10589d967718f5f44b313cf4ea922'
            '39cdcaa6d98f543486b6b5720b43007db0e191444f282934405e42ad77ecbbfa')

prepare() {
  cd "$pkgname-$pkgver"

  # remove precompiled binary
  rm -f "$pkgname/$pkgname"
}

build() {
  cd "$pkgname-$pkgver"
  lazbuild -B "$pkgname/$pkgname.lpi" --bm=Release --lazarusdir=/usr/lib/lazarus
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
}
