# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=vkroots-git
pkgver=r35.5c217cd 
pkgrel=1
pkgdesc="A stupid simple method of making Vulkan layers, at home!"
arch=(any)
url="https://github.com/Joshua-Ashton/vkroots"
license=('LGPL-2.1-or-later AND (Apache-2.0 or MIT)')
makedepends=("git" "meson" "vulkan-headers")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Joshua-Ashton/vkroots.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$srcdir/${pkgname%-git}" build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

	cd "$srcdir/${pkgname%-git}"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
