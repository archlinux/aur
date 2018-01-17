# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker-git
pkgver=2018.01.09.r116.g0323bd56
pkgrel=1
pkgdesc="A gtk3 markdown editor"
arch=('x86_64')
url="https://github.com/fabiocolacio/Marker"
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

prepare() {
  sed -e '/^meson.add_install_script/ s/^#*/#/' -i Marker/meson.build
}

build() {
  cd Marker
  rm -rf _build
  meson _build --prefix=/usr
  ninja -C _build
}

package() {
  cd Marker
  env DESTDIR="$pkgdir" ninja -C _build install
}
