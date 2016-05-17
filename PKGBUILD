# Maintainer: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=lunarg-vulkan-sdk
pkgver=1.0.3.1
pkgrel=1
pkgdesc="Vulkan loader for amdgpu-pro (It sucks, but you have to download it yourself and put it in the same directory as your PKGBUILD, see url), make sure you don't have dpkg installed"
url='https://vulkan.lunarg.com'
license=('custom')
arch=('i686' 'x86_64')
depends=('amdgpu-pro')
conflicts=('dpkg')

build() {
    sed -i -e '1,501d' ../vulkansdk-linux-x86_64-1.0.3.1.run
    tar -C "${srcdir}" -xf ../vulkansdk-linux-x86_64-1.0.3.1.run
}

package() {
	cd 1.0.3.1/install
	rm -Rf vulkan-loader_1.0.3.1_amd64 vulkan-sdk-headers_1.0.3.1_amd64 vulkan-sdk-runtime_1.0.3.1_amd64
	mkdir vulkan-loader_1.0.3.1_amd64 vulkan-sdk-headers_1.0.3.1_amd64 vulkan-sdk-runtime_1.0.3.1_amd64
	cd vulkan-loader_1.0.3.1_amd64
	ar x ../vulkan-loader_1.0.3.1_amd64.deb
	tar -C "${pkgdir}" -xf data.tar.xz
	
	cd ../vulkan-sdk-headers_1.0.3.1_amd64
	ar x ../vulkan-sdk-headers_1.0.3.1_amd64.deb
	tar -C "${pkgdir}" -xf data.tar.xz
	
	cd ../vulkan-sdk-runtime_1.0.3.1_amd64
	ar x ../vulkan-sdk-runtime_1.0.3.1_amd64.deb
	tar -C "${pkgdir}" -xf data.tar.xz
}
