# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>
pkgname=wivrn-client-git
pkgver=r2779.6f9e146
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64 aarch64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")

depends=(
    "openxr>=1.1.58"
    "fontconfig"
    "curl"
    "boost-libs>=1.84"
    "ktx-software-bin"
    "vulkan-icd-loader"
    "ffmpeg"
    "freetype2"
    "harfbuzz"
    "openssl"
    "gcc-libs"
    "glibc"
)

makedepends=(
	"git"
	"cmake"
	"ninja"
    "pkgconf"
    "python"
    "ktx-software-bin"
    "curl"
    "boost>=1.84"
    "ffmpeg"
    "openssl"
    "fontconfig"
    "jsoncpp"
    "librsvg"
	"vulkan-headers"
    "shaderc"
    "glslang"
    "libx11"
    "libxext"
    "libxcb"
    "wayland"
    "gcc-libs"
    "glibc"
    "openxr>=1.1.58"
)

source=("git+https://github.com/WiVRn/WiVRn.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/WiVRn"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd WiVRn

	cmake -B build-client . \
	-G Ninja \
	-DWIVRN_BUILD_CLIENT=ON \
    -DWIVRN_BUILD_SERVER=OFF \
    -DWIVRN_BUILD_WIVRNCTL=OFF \
    -DWIVRN_USE_SYSTEM_OPENXR=OFF \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-Wno-dev

	cmake --build build-client
}

package() {
	cd "WiVRn"
	DESTDIR="$pkgdir" cmake --install build-client
}
