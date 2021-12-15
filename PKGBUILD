# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
pkgname=xnine-git
pkgver=r44.9481273
pkgrel=1
pkgdesc="Accelerate your Source -vulkan games."
arch=(x86_64)
url="https://github.com/zmike/Xnine"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("Xnine::git+$url#branch=master")
md5sums=('SKIP')

pkgver() {
	cd Xnine
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd Xnine
    mkdir -p "$pkgdir/usr/share/Xnine/"
    install -Dm755 nine_sdl.so "$pkgdir/usr/share/Xnine/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/Xnine/LICENSE"
}

post_install() {
    echo "In Steam properties, make sure to 'LD_PRELOAD=/usr/share/Xnine/nine_sdl.so %command%'"
}
