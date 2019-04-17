# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=screamingfrogseospider
pkgver=11.2
pkgrel=1
pkgdesc="A small desktop program you can install on your PC or Mac which spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('any')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=('jre8-openjdk' 'java-openjfx')
makedepends=()
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
  # Fix java path
  sed -i "s%usr/share/screamingfrogseospider/jre%usr/lib/jvm/java-8-openjdk/jre%g" "$srcdir/usr/bin/screamingfrogseospider"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
