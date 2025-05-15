pkgname=eden
pkgver=0.0.2
pkgrel=2
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://eden-emulator.github.io/
license=('GPL-3.0')
provides=('eden')
depends=('qt6-base' 'qt6-webengine' 'clang' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'ffmpeg' 'sdl2-compat' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus' 'boost')
makedepends=('curl' 'git' 'sdl2' 'gcc' 'cmake' 'clang' 'llvm' 'doxygen' 'python-pip' 'glslang' 'ninja' 'zip' 'unzip' 'boost' 'catch2' 'mbedtls' 'ninja' 'glslang' 'libzip' 'lz4' 'fmt' 'zip' 'unzip' 'nlohmann-json' 'openssl' 'dynarmic' 'opus' 'zlib' 'zstd')
conflicts=('eden-git' 'eden-bin')
options=('!debug')
source=("git+https://git.eden-emu.dev/eden-emu/eden#tag=$pkgver-pre-alpha"
		"git+https://git.eden-emu.dev/eden-emu/enet.git"
		"git+https://git.eden-emu.dev/eden-emu/cubeb.git"
		"git+https://git.eden-emu.dev/eden-emu/dynarmic.git"
		"git+https://git.eden-emu.dev/eden-emu/libusb.git"
		"git+https://git.eden-emu.dev/eden-emu/discord-rpc.git"
		"git+https://git.eden-emu.dev/eden-emu/Vulkan-Headers.git"
		"git+https://git.eden-emu.dev/eden-emu/sirit.git"
		"git+https://git.eden-emu.dev/eden-emu/mbedtls.git"
		"git+https://git.eden-emu.dev/eden-emu/cpp-httplib.git"
		"ffmpeg::git+https://git.eden-emu.dev/eden-emu/FFmpeg.git"
		"git+https://git.eden-emu.dev/eden-emu/SDL.git"
		"git+https://git.eden-emu.dev/eden-emu/opus.git"
		"git+https://git.eden-emu.dev/eden-emu/vcpkg.git"
		"git+https://git.eden-emu.dev/eden-emu/cpp-jwt.git"
		"git+https://git.eden-emu.dev/eden-emu/libadrenotools.git"
		"git+https://git.eden-emu.dev/eden-emu/tzdb_to_nx.git"
		"git+https://git.eden-emu.dev/eden-emu/VulkanMemoryAllocator.git"
		"git+https://git.eden-emu.dev/eden-emu/breakpad.git"
		"git+https://git.eden-emu.dev/eden-emu/simpleini.git"
		"git+https://git.eden-emu.dev/eden-emu/Vulkan-Utility-Libraries.git"
		"git+https://git.eden-emu.dev/eden-emu/oboe.git"
		"boost-headers::git+https://git.eden-emu.dev/eden-emu/headers.git"
		"git+https://github.com/google/googletest"
		"git+https://github.com/arsenm/sanitizers-cmake"
		"git+https://github.com/mozilla/cubeb-coreaudio-rs"
		"git+https://github.com/mozilla/cubeb-pulse-rs"
		"git+https://git.eden-emu.dev/eden-emu/fmt"
		"git+https://git.eden-emu.dev/eden-emu/biscuit.git"
		"catch::git+https://git.eden-emu.dev/eden-emu/Catch2.git"
		"git+https://git.eden-emu.dev/eden-emu/fmt.git"
		"git+https://git.eden-emu.dev/eden-emu/mcl.git"
		"git+https://git.eden-emu.dev/eden-emu/oaknut.git"
		"git+https://git.eden-emu.dev/eden-emu/robin-map.git"
		"git+https://git.eden-emu.dev/eden-emu/xbyak.git"
		"zycore::git+https://git.eden-emu.dev/eden-emu/zycore-c.git"
		"git+https://git.eden-emu.dev/eden-emu/zydis.git"
		"dynarmic_patch.patch"
		"spirv_patch.patch")
sha256sums=('66e5282b7b60624008d44ca17dd7a06cb0fbfa82375e6bf521fb2dea971f2807'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6818ea774477932afda31ff464dc3864d3c6109047a6e3842196fa5e4cdce895'
            'a0cc50a8c71694f116c95e2d0b9efb21ca1a282958f259cca423c33b7b764127')
prepare() {
	cd $srcdir/eden
	git submodule init
  for _submodule in enet cubeb dynarmic libusb discord-rpc Vulkan-Headers sirit mbedtls xbyak opus SDL cpp-httplib ffmpeg vcpkg cpp-jwt libadrenotools tzdb_to_nx VulkanMemoryAllocator breakpad simpleini oaknut Vulkan-Utility-Librries oboe booost-headers;
    do
      git config submodule.$_submodule.url "${srcdir}/$_submodule"
    done
  git -c protocol.file.allow=always submodule update --init
  
  cd $srcdir/eden/externals/cubeb
  git submodule init
  for _submodule in googletest sanitizers-cmake cubeb-coreaudio-rs cubeb-pulse-rs;
    do
	  git config submodule.$_submodule.url "${srcdir}/$_submodule"
	done
  git -c protocol.file.allow=always submodule update --init
  
  cd $srcdir/eden/externals/nx_tzdb/tzdb_to_nx
  git submodule init
  git config submodule.tz.url "$srcdir/$_submodule"
  git -c protocol.file.allow=always submodule update --init
  
cd $srcdir/eden/externals/sirit
git submodule init
#  git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
git -c protocol.file.allow=always submodule update --init

  cd $srcdir/eden/externals/dynarmic
  git submodule init
  for _submodule in {biscuit fmt mcl oaknut robin-map xbyak zycore zydis};
    do
	  git config submodule.${_submodule}.url "$srcdir/$_submodule"
	done
  git -c protocol.file.allow=always submodule update --init

#Patch CMakeLists in eden/externals to not use system dynarmic to avoid glad-related error  
patch $srcdir/$pkgname/externals/CMakeLists.txt $srcdir/dynarmic_patch.patch

#Patch CMakeLists in sirit to force using spirv-headers from externals to avoid compatibility issues
patch $srcdir/$pkgname/externals/sirit/CMakeLists.txt $srcdir/spirv_patch.patch
}
build() {
	cd $srcdir/eden
	cmake -B Build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_CXX_COMPILER=clang++ \
    	-DCMAKE_C_COMPILER=clang \
		-DYUZU_ENABLE_LTO=ON \
		-DYUZU_USE_BUNDLED_VCPKG=ON \
		-DYUZU_TESTS=OFF
	cmake --build Build
}
package() {
	DESTDIR="$pkgdir/" cmake --install $srcdir/eden/Build
}
