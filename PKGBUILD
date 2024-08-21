# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider-jre
pkgver=20.2
pkgrel=1
pkgdesc="bundled jre from screaming frog seo spider package if you have issues with openjdk"
arch=('x86_64' 'i686')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=('screamingfrogseospider')
makedepends=('tar')
source=(
  "screamingfrogseospider_${pkgver}_all.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb?noredirect"
  "LICENSE"
)
sha256sums=('ea994bae217d83d0c55eab56e6a9d7dfa2e598410fafee727e9a8ffaee7169e8'
            '855f01069c19bb605e344fb9e42ca63caeeb2c214c4be04ad4990a749f3cf069')
b2sums=('a12451bd2873b959ad7e8b231f8d4377b44063d1c56c04c192cd0ab909f0547068400c9bb12a1070738bb3f18d37f1080a4c2da351e3b5e6e8c190c7e948ee00'
        '6cde786ef5e5bf0e2d1cb9403eb9bbe6923731e22263e1cd2b3c3f0258d6efb4151eba5b59ee9e87894d17af75f1f72509bd389d1425a9fcab37ba51d9b50cd7')

build() {
  msg "Extracting deb data..."
  tar xf "$srcdir/data.tar.xz" -C "$srcdir"
  ls -lah "$srcdir"
  ls -lah "$srcdir/usr/"
  ls -lah "$srcdir/usr/share/"
  ls -lah "$srcdir/usr/bin/"
  rm -f "$srcdir/usr/share/screamingfrogseospider/ScreamingFrogSEOSpider.jar"
  rm -rf "$srcdir/usr/bin"
}

package() {
  install -d "${pkgdir}/usr/share/screamingfrogseospider"
  cp -dpr --no-preserve=ownership "$srcdir/usr/share/screamingfrogseospider/jre" "$pkgdir/usr/share/screamingfrogseospider/"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
