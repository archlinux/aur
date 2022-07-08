# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=flowtime
_pkgname=Flowtime
pkgver=2.5
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64' 'aarch64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL3')
depends=('gstreamer' 'libadwaita' 'libxml2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('09cc953138160c172470e8cea096b29dc985cb80f40513e642be694f21ba154743ef4dde68a5511fb2f7242622e14ee38582de818bda72b6a4fd06b1bdcf2590')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
