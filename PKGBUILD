# Maintainer: Carlos Valderrama Montes <carlosvalde9@gmail.com>

pkgname=rofi-reddit
_pkgname=rofi-reddit
pkgver=0.1.2
pkgrel=1
pkgdesc='Browse reddit threads from rofi using the Reddit API'
url='https://github.com/valdebrutal/rofi-reddit'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('rofi' 'curl' 'jansson' 'glibc')
makedepends=('git' 'meson')
options=('!debug')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

pkgver() {
  curl -s "https://api.github.com/repos/valdebrutal/rofi-reddit/tags" |
  grep -m1 '"name":' |
  sed -E 's/.*"name": "([^"]+)".*/\1/'
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson subprojects download tomlc17
}

build() {
  cd "${srcdir}"
  meson setup "${pkgname}-${pkgver}" build -Dtests=false
  meson compile -C build
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"
}

