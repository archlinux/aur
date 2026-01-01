# Maintainer: sanjeebmahala <sanjeebmahala at mail dot ru>
pkgname=rein-git
pkgver=r1342.26331bb
pkgrel=1
pkgdesc="Minimalist engine for 2d games & demos"
url="https://github.com/hugeping/rein"
license=("MIT")
source=("$pkgname"::"git+$url.git")
md5sums=("SKIP")
arch=("any")
depends=("sdl3" "luajit")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make -f Makefile-sdl3 PREFIX="/usr"
}

package() {
  cd "$pkgname"
  make -f Makefile-sdl3 DESTDIR="$pkgdir/" PREFIX="/usr" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
