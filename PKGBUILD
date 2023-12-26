# Maintainer: EXtremeExploit <pedro.montes.alcalde@gmail.com>
# Contributor: Severin Kaderli <severin@kaderli.dev>
# Contributor: aimileus < $(echo YWltaWxpdXNAcHJvdG9ubWFpbC5jb20K | base64 -d)

_pkgname="vita3k"
pkgname="$_pkgname-git"
pkgver=r3529.bef1567a6
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
	'libcurl-gnutls'
	'sdl2'
)
optdepends=(
	'vulkan-validation-layers: Descriptive vulkan errors'
)
provides=('vita3k')
conflicts=('vita3k')
source=(
	"$_pkgname"::"git+$url.git"
	"vita3k.desktop"

	# submodules for vita3k
	'SPIRV-Cross'::'git+https://github.com/KhronosGroup/SPIRV-Cross.git'
	'Vulkan-Headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'VulkanMemoryAllocator-Hpp'::'git+https://github.com/Macdu/VulkanMemoryAllocator-Hpp.git'
	'better-enums'::'git+https://github.com/aantron/better-enums.git'
	'capstone'::'git+https://github.com/aquynh/capstone.git'
	'concurrentqueue'::'git+https://github.com/cameron314/concurrentqueue.git'
	'crypto-algorithms'::'git+https://github.com/KorewaWatchful/crypto-algorithms.git'
	'cubeb'::'git+https://github.com/mozilla/cubeb.git'
	'dirent'::'git+https://github.com/tronkko/dirent.git'
	'fmt'::'git+https://github.com/fmtlib/fmt.git'
	'glslang'::'git+https://github.com/KhronosGroup/glslang.git'
	'googletest'::'git+https://github.com/google/googletest.git'
	'imgui'::'git+https://github.com/ocornut/imgui.git'
	'imgui_club'::'git+https://github.com/ocornut/imgui_club.git'
	'nativefiledialog-extended'::'git+https://github.com/btzy/nativefiledialog-extended.git'
	'pugixml'::'git+https://github.com/zeux/pugixml.git'
	'sdl2-cmake-scripts'::'git+https://github.com/tcbrindle/sdl2-cmake-scripts.git'
	'spdlog'::'git+https://github.com/gabime/spdlog.git'
	'stb'::'git+https://github.com/nothings/stb.git'
	'tracy'::'git+https://github.com/wolfpld/tracy.git'
	'vita-toolchain'::'git+https://github.com/vitasdk/vita-toolchain.git'
	'vita3k-LibAtrac9'::'git+https://github.com/Vita3K/LibAtrac9.git'
	'vita3k-boost'::'git+https://github.com/Vita3K/ext-boost.git'
	'vita3k-dlmalloc'::'git+https://github.com/Vita3K/dlmalloc.git'
	'vita3k-dynarmic'::'git+https://github.com/Vita3K/dynarmic.git'
	'vita3k-ffmpeg'::'git+https://github.com/Vita3K/ffmpeg-core.git'
	'vita3k-libfat16'::'git+https://github.com/Vita3K/libfat16.git'
	'vita3k-printf'::'git+https://github.com/Vita3K/printf.git'
	'vita3k-psvpfstools'::'git+https://github.com/Vita3K/psvpfstools.git'
	'vita3k-sdl'::'git+https://github.com/Vita3K/sdl.git'
	'vita3k-unicorn'::'git+https://github.com/Vita3K/unicorn.git'
	'xxHash'::'git+https://github.com/Cyan4973/xxHash.git'
	'yaml-cpp'::'git+https://github.com/jbeder/yaml-cpp.git'

	# submodules for VulkanMemoryAllocator-Hpp
	'VulkanMemoryAllocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'

	# submodules for capstone
	#'tree-sitter-cpp'::'git+https://github.com/tree-sitter/tree-sitter-cpp.git'

	# submodules for cubeb
	#'googletest'::'git+https://github.com/google/googletest.git'
	'sanitizers-cmake'::'git+https://github.com/arsenm/sanitizers-cmake.git'

	# submodules for vita-toolchain
	'psp2rela'::'git+https://github.com/Princess-of-Sleeping/psp2rela.git'

	# submodules for vita3k-psvpfstools
	'libb64'::'git+https://github.com/korewawatchful/libb64.git'
	'libtomcrypt'::'git+https://github.com/korewawatchful/libtomcrypt.git'
	'libzrif'::'git+https://github.com/KorewaWatchful/libzrif.git'
	'psvpfsparser'::'git+https://github.com/Vita3K/psvpfsparser.git'
	'zlib'::'git+https://github.com/korewawatchful/zlib.git'
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

	#'SKIP'

	#'SKIP'
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	(
		# submodules for vita3k
		local -A _submodules=(
			['SPIRV-Cross']='external/SPIRV-Cross'
			['Vulkan-Headers']='external/Vulkan-Headers'
			['VulkanMemoryAllocator-Hpp']='external/VulkanMemoryAllocator-Hpp'
			['better-enums']='external/better-enums'
			['capstone']='external/capstone'
			['concurrentqueue']='external/concurrentqueue'
			['crypto-algorithms']='external/crypto-algorithms'
			['cubeb']='external/cubeb'
			['dirent']='external/dirent'
			['fmt']='external/fmt'
			['glslang']='external/glslang'
			['googletest']='external/googletest'
			['imgui']='external/imgui'
			['imgui_club']='external/imgui_club'
			['nativefiledialog-extended']='external/nativefiledialog-extended'
			['pugixml']='external/pugixml'
			['sdl2-cmake-scripts']='external/sdl2-cmake-scripts'
			['spdlog']='external/spdlog'
			['stb']='external/stb'
			['tracy']='external/tracy'
			['vita-toolchain']='external/vita-toolchain'
			['vita3k-LibAtrac9']='external/LibAtrac9'
			['vita3k-boost']='external/boost'
			['vita3k-dlmalloc']='external/dlmalloc'
			['vita3k-dynarmic']='external/dynarmic'
			['vita3k-ffmpeg']='external/ffmpeg'
			['vita3k-libfat16']='external/libfat16'
			['vita3k-printf']='external/printf'
			['vita3k-psvpfstools']='external/psvpfstools'
			['vita3k-sdl']='external/sdl'
			['vita3k-unicorn']='external/unicorn'
			['xxHash']='external/xxHash'
			['yaml-cpp']='external/yaml-cpp'
		)
		for key in ${!_submodules[@]} ; do
			git submodule init "${_submodules[${key}]}"
			git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
			git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
		done
	)
	(
		# submodules for VulkanMemoryAllocator-Hpp
		cd "external/VulkanMemoryAllocator-Hpp"
		local -A _submodules=(
			['VulkanMemoryAllocator']='VulkanMemoryAllocator'
		)
		for key in ${!_submodules[@]} ; do
			git submodule init "${_submodules[${key}]}"
			git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
			git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
		done
	)
	(
		# submodules for cubeb
		cd "external/cubeb"
		local -A _submodules=(
			['googletest']='googletest'
			['sanitizers-cmake']='cmake/sanitizers-cmake'
		)
		for key in ${!_submodules[@]} ; do
			git submodule init "${_submodules[${key}]}"
			git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
			git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
		done
	)
	(
		# submodules for vita-toolchain
		cd "external/vita-toolchain"
		local -A _submodules=(
			['psp2rela']='psp2rela'
		)
		for key in ${!_submodules[@]} ; do
			git submodule init "${_submodules[${key}]}"
			git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
			git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
		done
	)
	(
		# submodules for vita3k-psvpfstools
		cd "external/psvpfstools"
		local -A _submodules=(
			['libb64']='libb64'
			['libtomcrypt']='libtomcrypt'
			['libzrif']='libzrif'
			['psvpfsparser']='psvpfsparser'
			['zlib']='zlib'
		)
		for key in ${!_submodules[@]} ; do
			git submodule init "${_submodules[${key}]}"
			git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
			git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
		done
	)
}

build() {
	cd "$srcdir/$_pkgname"

	export BUILDPRESET=linux-ninja-clang

	# Needed to have correct title version
	git remote set-url origin ${url}

	# Configure
	cmake --preset ${BUILDPRESET} -DUSE_VITA3K_UPDATE=OFF -DXXH_X86DISPATCH_ALLOW_AVX=ON
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

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 "data/image/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
	install -Dm644 "$srcdir/vita3k.desktop" "$pkgdir/usr/share/applications/vita3k.desktop"
}
