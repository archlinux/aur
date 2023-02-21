# Maintainer: EXtremeExploit <pedro.montes.alcalde@gmail.com>
# Contributor: Severin Kaderli <severin@kaderli.dev>
# Contributor: aimileus < $(echo YWltaWxpdXNAcHJvdG9ubWFpbC5jb20K | base64 -d)

_pkgname="vita3k"
pkgname="$_pkgname-git"
pkgver=r3002.4dfc3911
pkgrel=1
pkgdesc="Experimental PlayStation Vita emulator"
arch=('x86_64')
url="https://github.com/Vita3K/Vita3K"
license=('GPL2')
makedepends=(
	'boost'
	'clang'
	'cmake'
	'git'
	'lld'
	'ninja'
	'python'
)
depends=(
	'dbus'
	'sdl2'
)
optdepends=(
	'vulkan-validation-layers: Descriptive vulkan errors'
)
provides=('vita3k')
conflicts=('vita3k')
source=(
	"$_pkgname"::"git+$url"
	"vita3k.desktop"

	# submodules for vita3k
	'LibAtrac9'::'git+https://github.com/Vita3K/LibAtrac9'
	'SPIRV-Cross'::'git+https://github.com/KhronosGroup/SPIRV-Cross'
	'Vulkan-Headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers'
	'VulkanMemoryAllocator-Hpp'::'git+https://github.com/Macdu/VulkanMemoryAllocator-Hpp'
	'better-enums'::'git+https://github.com/aantron/better-enums'
	'boost'::'git+https://github.com/Vita3K/ext-boost'
	'capstone'::'git+https://github.com/aquynh/capstone'
	'crypto-algorithms'::'git+https://github.com/KorewaWatchful/crypto-algorithms'
	'cubeb'::'git+https://github.com/mozilla/cubeb'
	'dirent'::'git+https://github.com/tronkko/dirent'
	'dlmalloc'::'git+https://github.com/Vita3K/dlmalloc'
	'dynarmic'::'git+https://github.com/Vita3K/dynarmic'
	'ffmpeg'::'git+https://github.com/Vita3K/ffmpeg-core'
	'fmt'::'git+https://github.com/fmtlib/fmt'
	'glslang'::'git+https://github.com/KhronosGroup/glslang'
	'googletest'::'git+https://github.com/google/googletest'
	'imgui'::'git+https://github.com/ocornut/imgui'
	'imgui_club'::'git+https://github.com/ocornut/imgui_club'
	'libfat16'::'git+https://github.com/Vita3K/libfat16'
	'nativefiledialog-extended'::'git+https://github.com/btzy/nativefiledialog-extended'
	'printf'::'git+https://github.com/Vita3K/printf'
	'psvpfstools'::'git+https://github.com/Vita3K/psvpfstools'
	'pugixml'::'git+https://github.com/zeux/pugixml'
	'sdl'::'git+https://github.com/Vita3K/sdl'
	'sdl2-cmake-scripts'::'git+https://github.com/tcbrindle/sdl2-cmake-scripts'
	'spdlog'::'git+https://github.com/gabime/spdlog'
	'stb'::'git+https://github.com/nothings/stb'
	'tracy'::'git+https://github.com/wolfpld/tracy'
	'unicorn'::'git+https://github.com/Vita3K/unicorn'
	'vita-toolchain'::'git+https://github.com/vitasdk/vita-toolchain'
	'xxHash'::'git+https://github.com/Cyan4973/xxHash'
	'yaml-cpp'::'git+https://github.com/jbeder/yaml-cpp'

	# submodules for VulkanMemoryAllocator-Hpp
	'VulkanMemoryAllocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator'

	#submodules for cubeb
	'sanitizers-cmake'::'git+https://github.com/arsenm/sanitizers-cmake'

	# submodules for psvpfstools
	'psvpfsparser'::'git+https://github.com/Vita3K/psvpfsparser'
	'libzrif'::'git+https://github.com/KorewaWatchful/libzrif'
	'libb64'::'git+https://github.com/korewawatchful/libb64'
	'zlib'::'git+https://github.com/korewawatchful/zlib'
	'libtomcrypt'::'git+https://github.com/korewawatchful/libtomcrypt'

	# submodules for vita-toolchain
	'psp2rela'::'git+https://github.com/Princess-of-Sleeping/psp2rela'
)
sha256sums=(
	'SKIP'
	'18009fe1d5e6b44854ab360d0ec01955858d5ddf03f0a807a97cf1c3491d77f7'

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
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	# submodules for vita3k
	_submodules=(
		'LibAtrac9'
		'SPIRV-Cross'
		'Vulkan-Headers'
		'VulkanMemoryAllocator-Hpp'
		'better-enums'
		'boost'
		'capstone'
		'crypto-algorithms'
		'cubeb'
		'dirent'
		'dlmalloc'
		'dynarmic'
		'ffmpeg'
		'fmt'
		'glslang'
		'googletest'
		'imgui'
		'imgui_club'
		'libfat16'
		'nativefiledialog-extended'
		'printf'
		'psvpfstools'
		'pugixml'
		'sdl'
		'sdl2-cmake-scripts'
		'spdlog'
		'stb'
		'tracy'
		'unicorn'
		'vita-toolchain'
		'xxHash'
		'yaml-cpp'
	)

	for submodule in ${_submodules[@]} ; do
		git submodule init "external/$submodule"
		git submodule set-url "external/$submodule" "$srcdir/$submodule"
		git -c protocol.file.allow=always submodule update "external/$submodule"
	done

	# submodules for VulkanMemoryAllocator-Hpp
	cd "$srcdir/$_pkgname/external/VulkanMemoryAllocator-Hpp"
	_submodules=('VulkanMemoryAllocator')
	for submodule in ${_submodules[@]} ; do
		git submodule init "$submodule"
		git submodule set-url "$submodule" "$srcdir/$submodule"
		git -c protocol.file.allow=always submodule update "$submodule"
	done

	# submodules for cubeb
	cd "$srcdir/$_pkgname/external/cubeb"
	_submodules=(
		'googletest'
		'cmake/sanitizers-cmake'
	)
	for submodule in ${_submodules[@]} ; do
		git submodule init "$submodule"
		git submodule set-url "$submodule" "$srcdir/${submodule##*/}"
		git -c protocol.file.allow=always submodule update "$submodule"
	done

	# submodules for psvpfstools
	cd "$srcdir/$_pkgname/external/psvpfstools"
	_submodules=(
		'libb64'
		'libtomcrypt'
		'libzrif'
		'psvpfsparser'
		'zlib'
	)
	for submodule in ${_submodules[@]} ; do
		git submodule init "$submodule"
		git submodule set-url "$submodule" "$srcdir/$submodule"
		git -c protocol.file.allow=always submodule update "$submodule"
	done

	#submodules for vita-toolchain
	cd "$srcdir/$_pkgname/external/vita-toolchain"
	_submodules=('psp2rela')
	for submodule in ${_submodules[@]} ; do
		git submodule init "$submodule"
		git submodule set-url "$submodule" "$srcdir/$submodule"
		git -c protocol.file.allow=always submodule update "$submodule"
	done

	# git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_pkgname"

	export BUILDPRESET=linux-ninja-clang

	# Needed to have correct title version
	# git remote set-url origin ${url}

	# Configure
	cmake --preset ${BUILDPRESET} -DUSE_VITA3K_UPDATE=OFF
	# Build
	cmake --build build/${BUILDPRESET} --config Release
}

package() {
	depends+=(
		'hicolor-icon-theme'
		'xdg-desktop-portal'
	)

	cd "$srcdir/$_pkgname"

	mkdir -p "$pkgdir/usr/bin/" "$pkgdir/opt/vita3k/"

	cp -r "build/${BUILDPRESET}/bin/Release/"* "$pkgdir/opt/vita3k/"
	ln -s "/opt/vita3k/Vita3K" "$pkgdir/usr/bin/vita3k"

	# These folders needs 777 permissions because vita3k creates files in them
	chmod 777 "$pkgdir/opt/vita3k/"
	chmod 777 "$pkgdir/opt/vita3k/data"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 "data/image/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
	install -Dm644 "$srcdir/vita3k.desktop" "$pkgdir/usr/share/applications/vita3k.desktop"
}
