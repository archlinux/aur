# Maintainer: Campbell Jones <serebit at archlinux dot org>

pkgname=vkcheck-git
pkgver=r76.8e3de7b
pkgrel=1
pkgdesc='Display extensions supported by Vulkan implementations'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/serebit/vkcheck"
license=('Apache-2.0')
depends=(
    'glfw'
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libstdc++'
    'vulkan-driver'
    'vulkan-icd-loader'
)
makedepends=(
    'git'
    'cmake'
    'meson'
    'argparse'
    'vulkan-headers'
    'vulkan-profiles'
    'vulkan-utility-libraries'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://codeberg.org/serebit/vkcheck.git')
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$pkgname" build --wrap-mode default
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
