# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider-jre
pkgver=20.3
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
sha256sums=('8633b99f739b469e420fcbbbc0f5352173bc9f7d102e39992b586fd6dce3ed37'
            '855f01069c19bb605e344fb9e42ca63caeeb2c214c4be04ad4990a749f3cf069')
b2sums=('d6160a1f1a7ba9c255a60b97a0ce4a4ad4be801ae00ffd1c4f378dbfbe6e4897e1f81dab6531575cc8ccffaab469dbbc6bb27f0ac28433b3ec9aa90faa58a5ae'
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
