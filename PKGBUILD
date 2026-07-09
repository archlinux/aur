pkgname=archcalc
pkgver=1.2.0
pkgrel=1
pkgdesc="Built with precision. The definitive workspace and dev tools platform."
arch=('x86_64')
url="https://github.com/murtazapatel89100/ArchCalc"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2' 'openssl' 'libayatana-appindicator')
provides=('archcalc')
conflicts=('archcalc')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/archcalc_${pkgver}_amd64.deb")
sha256sums=('d1a7cce46cb35b4b22570affad41249f0042402280b7f6bfa33def03a8c623c3')

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
