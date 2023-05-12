# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=imaginer-git
_pkgname=Imaginer
pkgver=0.1.5
pkgrel=1
pkgdesc="Imagine with AI"
arch=('any')
url="https://imaginer.codeberg.page"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-openai' 'python-pillow'
         'python-requests')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://codeberg.org/Imaginer/Imaginer.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
