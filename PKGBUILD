# Maintainer: Kayque Pereira <kayquesousa02004@gmail.com>
pkgname=eb-garamond
pkgver=0.016
pkgrel=2
pkgdesc="Digitization of the Garamond shown on the Egenolff-Berner specimen"
arch=('any')
url="http://www.georgduffner.at/ebgaramond/"
license=('OFL')
depends=()
makedepends=('fontforge' 'ttfautohint' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/georgd/EB-Garamond/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e9d2883e3da42c8d31f3bbd209194ca7d729f2463fe781b078c3764c503b1e3')

prepare() {
  cd "EB-Garamond-${pkgver}"

  sed -i \
    "s|@\\\$(SFNTTOOL) -w \$< \$@|@fontforge -lang=ff -c 'Open(\$\$1); IgnoreErrors(1); Generate(\$\$2)' \$< \$@|" \
    Makefile
}

build() {
  cd "EB-Garamond-${pkgver}"
  make WEB=build EOT="" all || true
}

package() {
  cd "EB-Garamond-${pkgver}"
  install -Dm644 build/*.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 build/*.otf  -t "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 build/*.woff -t "$pkgdir/usr/share/fonts/woff"
}
