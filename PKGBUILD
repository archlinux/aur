# Maintainer: Eduardo Flores <edfloreshz@gmail.com>

pkgname=done-git
pkgrel=1
pkgver=0.1.0
pkgdesc="Done is a simple to do app that aims to improve on the existing set of features provided to do apps to deliver the ultimate experience."
arch=('x86_64')
url="https://github.com/edfloreshz/done"
license=('GPL2')
depends=('gtk4' 'libadwaita' 'pkg-config')
makedepends=('cargo' 'git' 'meson' 'ninja')
optdepends=()
provides=('done')
conflicts=('done')
source=("done-git::git+https://github.com/edfloreshz/done#branch=main")
md5sums=('SKIP')

prepare() {
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    meson --prefix=/usr --buildtype=plain $pkgname build
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
