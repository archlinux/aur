# Maintainer: Amos Bird <amosbird@gmail.com>

pkgname=fcitx-dbus-commit-string
pkgver=v1.0.r0.g48a3951
pkgrel=1
pkgdesc='An add-on for fcitx to commit string via D-Bus'
arch=('x86_64')
url="https://github.com/amosbird/${pkgname}"
license=('custom:MIT')
depends=('fcitx>=4.2.9.2' 'dbus>=1.1.0')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/amosbird/${pkgname}.git")
md5sums=('SKIP')
provides=("${pkgname}=${pkgver%%.r*}-${pkgrel}")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "$pkgname"/build
	make DESTDIR="$pkgdir" install
}
