# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=imaginer-git
_pkgname=Imaginer
pkgver=0.1.3
pkgrel=1
pkgdesc="Imaginer with AI"
arch=('x86_64')
url="https://codeberg.org/Imaginer/Imaginer"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'python-gobject' 'libportal-gtk4' 'python-lxml' 'python-openai' 'python-requests' 'python-pillow')
makedepends=('git' 'meson' 'blueprint-compiler' 'gobject-introspection' )
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
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
