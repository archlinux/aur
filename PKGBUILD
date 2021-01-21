# Maintainer: Sematre <sematre at gmx dot de>
pkgname=mklittlefs-git
pkgver=r101.6b5c62d
pkgrel=1

pkgdesc="Utility for creating littlefs for upload on the ESP8266."
arch=('any')
url="https://github.com/earlephilhower/${pkgname%-git}"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	git submodule update --init
}

build() {
  cd "${pkgname%-git}"
  make dist
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
