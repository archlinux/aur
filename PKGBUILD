# Maintainer: Dendy Faist <dendy at fai dot st>

pkgname=keno-git
pkgrel=1
pkgver=r329.94348d9
pkgdesc='GTK4 client for Mastodon (git)'
arch=('i686' 'x86_64' 'aarch64')
url=https://codeberg.org/gatroig/keno
license=(GPL3)
depends=(curl sqlite gtk4 json-c)
makedepends=(git meson ninja gcc cmocka)
provides=(keno)
conflicts=(keno)
source=("git+$url"
        "git+https://codeberg.org/gatroig/libkenoma")
sha512sums=('SKIP' 'SKIP')

#prepare() {
#  cd keno
#  git submodule update --init
#}

pkgver() {
  cd keno
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd keno
  arch-meson build
  ninja -C build
}

package() {
  cd keno
  DESTDIR="$pkgdir" ninja -C build install
}
