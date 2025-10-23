# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider-jre
pkgver=23.0
pkgrel=1
pkgdesc="spiders websites’ links, images, CSS, script and apps from an SEO perspective. With bundled jre if you have issues with openjdk"
arch=('x86_64' 'i686')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
provides=('screamingfrogseospider')
conflicts=('screamingfrogseospider')
depends=('ttf-font')
makedepends=('tar')
source=(
  "screamingfrogseospider_${pkgver}_all.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb?noredirect"
  "LICENSE"
  "screamingfrogseospider"
)
b2sums=('d287aa9a6f3714eed481f54d1f4e01d8f96f461251e660bdf5a29fa180e3fe720ac4ee8cb0be0f21f3fc7fdf64d66ab9142c0954e35f2695b67cfefb89ef9bea'
        '6cde786ef5e5bf0e2d1cb9403eb9bbe6923731e22263e1cd2b3c3f0258d6efb4151eba5b59ee9e87894d17af75f1f72509bd389d1425a9fcab37ba51d9b50cd7'
        '7d0afe711366086d889a26237e96696b917552ea9023cbf5b11b4479943d1cd922c8adeafc3d988e5038a828775e810fdcce07ed5cad03c89da511747ed0c3cb')

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
