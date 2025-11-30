# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=adbmanager
pkgver=4.0
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
sha256sums=('130e96cf84645b716bdb8544dfb54ed04591bd7f25d9af938dbac0038f203bac'
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
