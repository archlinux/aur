# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=vkroots-git
pkgver=r26.e5eccf7
pkgrel=1
pkgdesc="A stupid simple method of making Vulkan layers, at home!"
arch=(any)
url="https://github.com/Joshua-Ashton/vkroots/tree/e6b89494142eec0ac6061f82a947d2f1246d3d7a"
license=("Apache" "custom:MIT")
makedepends=("git" "meson") # 'bzr', 'git', 'mercurial' or 'subversion'
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
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
