# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=screamingfrogseospider
pkgver=12.3
pkgrel=1
pkgdesc="A small desktop program you can install on your PC or Mac which spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('x86_64' 'i686')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=()
makedepends=('tar')
source=(
  "https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb"
  "LICENSE"
)
sha256sums=('80696f4e6d533db60cfae8fa0f1c064efdfe4c7ee321911daf8030e7e559141f'
            '855f01069c19bb605e344fb9e42ca63caeeb2c214c4be04ad4990a749f3cf069')

build() {
  msg "Extracting deb data..."
  tar xf "$srcdir/data.tar.xz" -C "$srcdir"
  msg2 "Done extracting deb data!"
  if [ "$CARCH" = "x86_64" ]; then
    _jre_file="jre64.tar.gz"
  else
    _jre_file="jre32.tar.gz"
  fi
  msg "Extracting jre..."
  tar xf "$srcdir/usr/share/screamingfrogseospider/tmp/$_jre_file" -C "$srcdir/usr/share/screamingfrogseospider"
  msg2 "Done extracting jre!"
  rm -rf "$srcdir/usr/share/screamingfrogseospider/tmp"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
