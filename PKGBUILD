# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname="relaxator-git"
_pkgname="relaxator"
pkgdesc="Relax to soothing sounds"

arch=(x86_64)
license=("GPL-3.0")

source=("git+https://github.com/alexkdeveloper/relaxator")
url="https://github.com/alexkdeveloper/relaxator"

pkgver=1.0.9.ee306a6
pkgrel=3

depends=("gtk4" "libadwaita" "vala")
makedepends=("meson" "ninja" "git")
provides=($_pkgname)

md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}

build() {
	cd "$_pkgname"
	meson build --prefix=/usr --buildtype=plain
	ninja -C build
}

package() {
	cd "$_pkgname"
	meson install -C build --destdir "$pkgdir"
    install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
