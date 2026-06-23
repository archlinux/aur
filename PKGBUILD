# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider-jre
pkgver=24.2
pkgrel=1
pkgdesc="spiders websites’ links, images, CSS, script and apps from an SEO perspective. With bundled jre if you have issues with openjdk"
arch=('x86_64' 'i686')
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
b2sums_x86_64=('5d8d23cb0d1c52c9f42f38b9fba11cb47ed12c1a54e99dbdf165d7100b97cf0759829f61302e93f69809e102cb0a747b342764aea8a3898ba591f1ab1c58fdd7')
b2sums_aarch64=('18050f1f4540083d8f5a709567ca3c5308752d4c83bc45c1deef0e7afad0c8f8b9c5ee7734c84f36dccb6d1f2f685a1152f215c325f1bf9a75e9655542638d61')

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
