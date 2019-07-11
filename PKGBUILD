# Maintainer: Sonny Piers <sonny@fastmail.net>

_name=gigagram
pkgname=$_name-git
pkgver=r38.8439cae
pkgrel=1
pkgdesc="Gigagram combines webapps and websites into a single application."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/sonnyp/gigagram"
license=('GPL3')
depends=('gjs')
makedepends=('git' 'meson')
provides=($_name)
conflicts=($_name)
source=("git+https://github.com/sonnyp/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_name

  meson --prefix=/usr/ build
  ninja -C build
}

package(){
  cd $_name

  DESTDIR="$pkgdir" meson install -C build
}
