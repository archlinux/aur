# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=coffee-git
pkgver=1.1.0.r0.g5b43105
pkgrel=1
pkgdesc="Keep up with current news and weather with Coffee"
arch=('i686' 'x86_64')
url="https://nick92.github.io/coffee/"
license=('GPL3')
depends=('geocode-glib' 'libgee' 'webkit2gtk')
makedepends=('git' 'meson' 'vala')
provides=('coffee')
conflicts=('coffee')
source=('git+https://github.com/nick92/coffee.git')
sha256sums=('SKIP')

pkgver() {
  cd coffee
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd coffee
  rm -rf _build
  meson _build --prefix=/usr
  ninja -C _build
}

package() {
  cd coffee
  env DESTDIR="$pkgdir" ninja -C _build install
}
