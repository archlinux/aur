# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=screamingfrogseospider
pkgver=11.2
pkgrel=2
pkgdesc="A small desktop program you can install on your PC or Mac which spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('any')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=()
makedepends=('tar')
source=(
  "https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb"
  "LICENSE"
)
sha256sums=(
  '04ccb77dd8955f52903d29041f380c4d9ee95f429b46cd5f5a3cb0f925556de2'
  '5f32a7baef326d88754c6581883800a8d68a753bec846a1d0c190460ab7a2424'
)

build() {
  cd "$srcdir"
  msg "Extracting..."
  tar xf data.tar.xz
  msg2 "Done extracting!"
  if [ "$CARCH" = "x86_64" ]; then
    _jre_file="jre64.tar.gz"
  else
    _jre_file="jre32.tar.gz"
  fi
  cd "$srcdir/usr/share/screamingfrogseospider/tmp"
  msg "Extracting jre..."
  tar xf "$_jre_file"
  msg2 "Done extracting jre!"
  mv "$srcdir/usr/share/screamingfrogseospider/tmp/jre" "$srcdir/usr/share/screamingfrogseospider/jre"
  rm -rf "$srcdir/usr/share/screamingfrogseospider/tmp"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
