# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=spirv-tools-sparzz-git
pkgver=2020.05.26
pkgrel=1
epoch=
pkgdesc="SPIR-V Tools build from source. My Vulkan packages from the AUR depends on this package. For install instruction and order of the of the install visit my GitHub page --> https://github.com/sparzz/vulkan-arch-aur  "
arch=(x86_64)
url="https://github.com/sparzz/vulkan-arch-aur"
license=('Apache')
groups=()
depends=("yay"
        "glslang-sparzz-git"
        "make"
        "cmake"
        "spirv-headers-sparzz-git")
makedepends=("cmake"
            "git"
            "make"
            "glslang-sparzz-git"
            "spirv-headers-sparzz-git")
checkdepends=()
optdepends=()
provides=(spirv-headers-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("SPIRV-Tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()


prepare() {
	cd SPIRV-Tools/external
	git clone https://github.com/google/googletest.git
	git clone https://github.com/google/effcee.git
	git clone https://github.com/google/re2.git 
	git clone https://github.com/KhronosGroup/SPIRV-Headers.git
	
}



package() {
	cmake setup SPIRV-Tools \
	-DGLSLANG_INSTALL_DIR=/usr/local/bin \
	-DSPIRV-Headers_SOURCE_DIR=/usr/local/include/spirv \
	-DSPIRV-Headers_SOURCE_DIR=/usr/local/lib/cmake/SPIRV-Headers \
	cmake configure -silent SPIRV-Tools
	make -silent DESTDIR="$pkgdir" install
}
