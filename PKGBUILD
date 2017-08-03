# Maintainer: Matt Harrison <matt@mistbyte.com>

pkgname=screamingfrogseospider
pkgver=8.1
pkgrel=1
pkgdesc="A small desktop program you can install on your PC or Mac which spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('any')
url="http://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=('java-environment' 'java-openjfx')
makedepends=()
source=(
  "https://www.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb"
  "LICENSE"
)
sha256sums=('a4f7e80dac2a9365e8c174903925f5cabdde78039a687250537a0e878f0d604d'
            '5f32a7baef326d88754c6581883800a8d68a753bec846a1d0c190460ab7a2424')

build() {
  cd "$srcdir"
  msg "Extracting..."
  tar xf data.tar.xz
  msg2 "Done extracting!"
  # Fix java path
  sed -i "s%usr/share/screamingfrogseospider/jre/bin%usr/bin%g" "$srcdir/usr/bin/screamingfrogseospider"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
