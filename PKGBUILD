# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=dyalog-bin
pkgver=18.0.40684
pkgrel=1
pkgdesc='Dyalog APL interpreter'
arch=('x86_64')
url="https://www.dyalog.com/download-zone.htm"
license=('non-free')
depends=(
  'ncurses5-compat-libs'
)
makedepends=(
  'binutils'
  'tar'
)
source=(
    "$pkgname-$pkgver.deb::https://www.dyalog.com/uploads/php/download.dyalog.com/download.php?file=18.0/linux_64_${pkgver}_unicode.x86_64.deb"
)

sha256sums=(
    "5b609bb177b3e6e3d39cce66181d6d321b1508a883f19a261508b59e46492b0f"
)

options=('!strip')

prepare() {
    ar x "$pkgname-$pkgver.deb"
    tar axvf data.tar.gz
    tar axvf control.tar.gz
}

pkgver() {
    grep Version control | cut -d" " -f2
}

package() {
  mkdir -p $pkgdir/usr/share/dyalog
  mkdir -p $pkgdir/usr/share/doc
  mkdir -p $pkgdir/usr/bin

  # Binary
  cp -a $srcdir/opt/mdyalog/18.0/64/unicode/* $pkgdir/usr/share/dyalog/

  # Docs
  cp -a $srcdir/usr/share/doc/* $pkgdir/usr/share/doc/

  # Launcher
  ln -s /usr/share/dyalog/dyalog $pkgdir/usr/bin/dyalog
}
