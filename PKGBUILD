# Maintainer: Ícar N. S. <icar.nin@protonmail.com>
pkgname=xnine-git
pkgver=r45.4f38fd5
pkgrel=2
pkgdesc="Native Direct3D9 driver for DXVK-Native games."
arch=(x86_64)
url="https://github.com/zmike/Xnine"
license=('MIT')
makedepends=('git' 'make' 'gcc')
depends=(
    'mesa'
	'lib32-mesa'
	'sdl2'
	'lib32-sdl2'
	'libx11'
	'lib32-libx11'
	'libxcb'
	'lib32-libxcb'
	'libxext'
	'lib32-libxext'
	'glibc'
	'lib32-glibc'
	'libxau'
	'lib32-libxau'
	'libxdmcp'
	'lib32-libxdmcp'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("Xnine::git+$url#branch=master")
md5sums=('SKIP')

pkgver() {
	cd Xnine
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd Xnine
    ./build.sh
}

package() {
	cd Xnine
    mkdir -p "$pkgdir/usr/share/Xnine/"
    install -Dm755 nine_sdl.so "$pkgdir/usr/share/Xnine/"
    install -Dm755 nine_sdl64.so "$pkgdir/usr/share/Xnine/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/Xnine/LICENSE"
}

post_install() {
    msg "In Steam properties, make sure to 'LD_PRELOAD=\"/usr/share/Xnine/nine_sdl.so /usr/share/Xnine/nine_sdl64.so\" %command%' -vulkan"
}
