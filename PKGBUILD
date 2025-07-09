# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider
pkgver=22.2
pkgrel=1
pkgdesc="spiders websites’ links, images, CSS, script and apps from an SEO perspective."
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
b2sums=('ad165cc503fa8b07c901cb3136ee9ab94320c5c619e24a2394ad06608abbab4d58a53e57cd42af1c75180990fa2b978f9b96da34d71ad1b49178f07175f209c1'
        '6cde786ef5e5bf0e2d1cb9403eb9bbe6923731e22263e1cd2b3c3f0258d6efb4151eba5b59ee9e87894d17af75f1f72509bd389d1425a9fcab37ba51d9b50cd7'
        '1c22167625276543fc356023f1ced343c8efb1ee8267587e6ba2a8a1c6fe6d3f7e0d4c40a048cb51c7131733d49ed4eb7eaececcfb54f1a124ca01bef8549ca4')

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
