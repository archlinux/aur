# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker-git
pkgver=2017.10.05.r2.g0fe645a
pkgrel=1
pkgdesc="A gtk3 markdown editor"
arch=('i686' 'x86_64')
url="https://github.com/fabiocolacio/Marker"
license=('GPL3')
depends=('gtksourceview3' 'webkit2gtk')
makedepends=('git' 'meson')
optdepends=('pandoc' 'wkhtmltopdf')
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
