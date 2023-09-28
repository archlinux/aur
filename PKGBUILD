# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider
pkgver=19.2
pkgrel=2
pkgdesc="A small desktop program you can install on your PC or Mac which spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('x86_64' 'i686')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=('java-runtime-openjdk>=17' 'ttf-font')
makedepends=('tar')
source=(
  "screamingfrogseospider_${pkgver}_all.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb?noredirect"
  "LICENSE"
  "screamingfrogseospider"
)
sha256sums=('e10b13930bae044c33829d1230bd0ae33b81f01fa11a76df66f7f0f802628fbc'
            '855f01069c19bb605e344fb9e42ca63caeeb2c214c4be04ad4990a749f3cf069'
            '60ad046fb03f769cf453f23a8bfdbd40d7280b2f133c02756328f75a485fa127')

build() {
  msg "Extracting deb data..."
  tar xf "$srcdir/data.tar.xz" -C "$srcdir"
  rm -rf "$srcdir/usr/share/screamingfrogseospider/jre"
  rm "$srcdir/usr/bin/screamingfrogseospider"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/screamingfrogseospider" "$pkgdir/usr/bin/screamingfrogseospider"
}

# vim:set ts=2 sw=2 et:
