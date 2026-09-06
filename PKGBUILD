# Maintainer: yum13241 <coolcrew45 at disroot dot org>

pkgname=elyprismlauncher
pkgver=11.1.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="Prism Launcher fork with integrated support for Ely.by accounts"
arch=('x86_64')
url="https://github.com/ElyPrismLauncher/Launcher"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(glibc mesa-utils gcc-libs java-runtime libarchive libgl pciutils qrencode qt6-base qt6-imageformats qt6-networkauth qt6-svg zlib hicolor-icon-theme tomlplusplus cmark)
makedepends=(cmake extra-cmake-modules git jdk8-temurin ninja scdoc ghc-filesystem gamemode vulkan-headers)
provides=('elyprismlauncher')
conflicts=('elyprismlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
            'flite: minecraft voice narration'
)
source=("https://github.com/ElyPrismLauncher/Launcher/releases/download/${_pkgver}/PineconeMC-${_pkgver}.tar.gz")
sha256sums=('SKIP')

build()
{
	export PATH="/usr/lib/jvm/java-8-temurin/bin:$PATH"
	cd PineconeMC-${_pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr --preset linux
	cmake --build build --config Release -j$(nproc)
}

package()
{
	cd PineconeMC-${_pkgver}
	DESTDIR="${pkgdir}" cmake --install build --config Release
}
