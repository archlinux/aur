# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nickvision-tagger
pkgver=2022.10.4
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=('x86_64')
url="https://github.com/nlogozzo/NickvisionTagger"
license=('GPL3')
depends=('chromaprint' 'jsoncpp' 'libadwaita' 'libcurlpp' 'taglib')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0a895facdb31022af4457415f9aec294d4c7a0f1f16933364c6db53eb554777f')

build() {
  arch-meson NickvisionTagger-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # conflicts with system chromaprint
  rm "$pkgdir/usr/bin/fpcalc"

  # File (usr/bin/org.nickvision.tagger) has the world writable bit set.
  chmod 0755 "$pkgdir/usr/bin/org.nickvision.tagger"

  ln -s /usr/bin/org.nickvision.tagger "$pkgdir/usr/bin/$pkgname"
}
