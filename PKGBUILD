# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker
pkgver=2018.01.09
pkgrel=1
pkgdesc='Markdown editor for linux made with Gtk+-3.0'
arch=('x86_64')
url='https://github.com/fabiocolacio/Marker'
license=('GPL3')
depends=('gtksourceview3' 'gtkspell3' 'webkit2gtk')
makedepends=('meson')
optdepends=('pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bd8b074ca5c1cdb4d85186b0a5d7d78e6880fcb4fba710a69b5f55194dd2d6be')

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
