# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker
pkgver=2018.01.28
pkgrel=1
pkgdesc='Markdown editor for linux made with Gtk+-3.0'
arch=('x86_64')
url='https://github.com/fabiocolacio/Marker'
license=('GPL3')
depends=('gtksourceview3' 'gtkspell3' 'webkit2gtk')
makedepends=('meson')
optdepends=('pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c356ff5766d6a41012c1ee61229ff8c9d45126fb953229d1f39852d8b62b1acf')

prepare() {
  sed -e '/^meson.add_install_script/ s/^#*/#/' -i Marker-$pkgver/meson.build
}

build() {
  cd Marker-$pkgver
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd Marker-$pkgver
  DESTDIR="$pkgdir" ninja install -C build
}
