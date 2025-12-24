# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>

pkgname=spedread
_pkgname=Spedread
pkgver=2.6.0
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64' 'aarch64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('3b81e96838ecf3daeb391414b7ca616822ffe8c0b15e3a95eea785c637cd709eb569b0b9b2042ae93484b9afc879bf1d57bc904d4f60c01b6db78d251866b4a8')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
