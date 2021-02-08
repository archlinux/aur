# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=vkresample-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Vulkan real-time FFT upscaling"
url="https://github.com/DTolm/VkResample"
license=('MPL2')
arch=( 'any' )
depends=('vulkan-driver' 'vulkan-icd-loader' 'glslang')
makedepends=(git cmake make 'vulkan-headers')
provides=(vkresample)
conflicts=(vkresample)
source=("git+https://github.com/DTolm/VkResample.git")
md5sums=('SKIP')

pkgver() {
    cd VkResample
    git tag | sort -r | head -1
}

build() {
	cd "${srcdir}/VkResample"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/VkResample"

	install -Dm755 "VkResample" "$pkgdir/usr/bin/VkResample"
}

