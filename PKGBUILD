# Maintainer: Voxan <admin at hessfr dot fr>

pkgname=pins
_pkgname=Pins
pkgver=2.4.6
pkgrel=1
pkgdesc="Create your own application shortcuts"
arch=('any')
url="https://github.com/fabrialberio/Pins"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('91acf8d4aefde4247c723e69b678603933d03547f053a040e3cc20a430c0aa454eb1b53fe5f9202a0e67bdcfcfadb4d17dcc7e58add083883a7171b531ea9cdf')

build() {
  arch-meson "${_pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
