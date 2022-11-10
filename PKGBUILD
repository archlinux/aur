# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Julian (luxio) <dev at luxio-media dot de>

pkgname=nickvision-tagger
pkgver=2022.11.0
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=('x86_64' 'aarch64')
url="https://github.com/nlogozzo/NickvisionTagger"
license=(GPL3)
depends=('gtk4' 'libadwaita' 'jsoncpp' 'libcurlpp' 'taglib' 'chromaprint')
makedepends=('git' 'meson')
source=("$pkgname-$pkgver"::"git+https://github.com/nlogozzo/NickvisionTagger.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    # removing fpcalc because it otherwise causes a conflict when chromaprint package is installed
    rm "$pkgdir/usr/bin/fpcalc"
}
