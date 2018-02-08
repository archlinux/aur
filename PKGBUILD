# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker-git
pkgver=2018.01.28.r0.g5ec76cba
pkgrel=1
pkgdesc='Markdown editor for linux made with Gtk+-3.0'
arch=('x86_64')
url='https://github.com/fabiocolacio/Marker'
license=('GPL3')
depends=('gtksourceview3' 'gtkspell3' 'webkit2gtk')
makedepends=('git' 'meson')
optdepends=('pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd Marker
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd Marker
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd Marker
  DESTDIR="$pkgdir" ninja install -C build
}
