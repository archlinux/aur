# Maintainer: Khamkou Uladzislau <hamk.vo@gmail.com>

pkgname=terminus-font-otb-narrow
pkgver=4.48
pkgrel=1

pkgdesc='Monospace bitmap font (OTB version with 1px space between characters)'
url=http://terminus-font.sourceforge.net/
arch=(any)
license=('custom:OFL' 'GPL2')
makedepends=(fonttosfnt)
conflicts=(terminus-font-otb)
provides=(terminus-font-otb)
source=("https://downloads.sourceforge.net/project/terminus-font/terminus-font-$pkgver/terminus-font-$pkgver.tar.gz")
sha256sums=('34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af')

build() {
  cd "terminus-font-$pkgver"
  for f in `ls *.bdf`; do
    fonttosfnt -b -c -g 2 -m 2 -o ${f%%.bdf}.otb $f
  done
}

package() {
  cd "terminus-font-$pkgver"
  for f in *.otb; do
      install -D -m0644 $f "$pkgdir/usr/share/fonts/${pkgname}/$f"
  done
  install -Dm644 OFL.TXT "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
