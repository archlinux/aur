# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider-jre
pkgver=24.3
pkgrel=1
pkgdesc="spiders websites’ links, images, CSS, script and apps from an SEO perspective. With bundled jre if you have issues with openjdk"
arch=('x86_64' 'aarch64')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
provides=('screamingfrogseospider')
conflicts=('screamingfrogseospider')
depends=('ttf-font' 'bash')
makedepends=('tar')
options=('!debug')
source=(
  "LICENSE"
  "screamingfrogseospider"
)
source_x86_64=("screamingfrogseospider_${pkgver}_amd64.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_amd64.deb")
source_aarch64=("screamingfrogseospider_${pkgver}_arm64.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_arm64.deb")
b2sums=('6cde786ef5e5bf0e2d1cb9403eb9bbe6923731e22263e1cd2b3c3f0258d6efb4151eba5b59ee9e87894d17af75f1f72509bd389d1425a9fcab37ba51d9b50cd7'
        '7d0afe711366086d889a26237e96696b917552ea9023cbf5b11b4479943d1cd922c8adeafc3d988e5038a828775e810fdcce07ed5cad03c89da511747ed0c3cb')
b2sums_x86_64=('963f5c75709600c868577b0cd07e08db0cf1b835c604718bfded4645e1495b8800a668a573a3d6f3e7f4505d870b1951c911d4225da7820b3200b1ae580bb631')
b2sums_aarch64=('cf72b1402ed650e0ef4fe79fa4d581bb8b2ac4fad2311378cb0efcb0056532334273ac8e31116a6627aef431860f55505782f2db1906e078c49cbde04da3ca3d')

build() {
  msg "Extracting deb data..."
  tar xf "$srcdir/data.tar.xz" -C "$srcdir"
  rm "$srcdir/usr/bin/screamingfrogseospider"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/screamingfrogseospider" "$pkgdir/usr/bin/screamingfrogseospider"
}

# vim:set ts=2 sw=2 et:
