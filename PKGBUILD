pkgname=archcalc
pkgver=1.5.0
pkgrel=1
pkgdesc="Built with precision. The definitive workspace and dev tools platform."
arch=('x86_64')
url="https://github.com/murtazapatel89100/ArchCalc"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2' 'openssl' 'libayatana-appindicator')
provides=('archcalc')
conflicts=('archcalc')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/archcalc_${pkgver}_amd64.deb")
sha256sums=('e1445f756fe2937eceb4e1b1ebe09d8d849c1287ef371ff6196d83276ab64dc3')

package() {
  bsdtar -xf "$srcdir/$pkgname-$pkgver.deb" -C "$srcdir"

  # The data tarball might be compressed with different algorithms
  if [ -f "$srcdir/data.tar.gz" ]; then
    tar -xzf "$srcdir/data.tar.gz" -C "$pkgdir"
  elif [ -f "$srcdir/data.tar.xz" ]; then
    tar -xJf "$srcdir/data.tar.xz" -C "$pkgdir"
  elif [ -f "$srcdir/data.tar.zst" ]; then
    tar -I zstd -xf "$srcdir/data.tar.zst" -C "$pkgdir"
  fi
}
