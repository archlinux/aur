# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nickvision-tagger
pkgver=2022.10.5
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=('x86_64')
url="https://github.com/nlogozzo/NickvisionTagger"
license=('GPL3')
depends=('chromaprint' 'jsoncpp' 'libadwaita' 'libcurlpp' 'taglib')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a3eb700d49807f35de621af9af5aedaba8535884f91c6b0d712ab7fc67ac255f')

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
