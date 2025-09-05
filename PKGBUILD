# Maintainer: username227 <gfrank227 at gmail dot com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname="mandarine"
pkgname=$_pkgname-git
pkgver=r10301.6ae06c5
pkgrel=2
arch=('x86_64')
pkgdesc='3ds emulator - citra fork with tweaks/enhancements'
url='https://github.com/mandarine3ds/mandarine'
license=("GPL-2.0-or-later")
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet' 'boost-libs')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'ninja' 'boost' 'spirv-tools')
conflicts=('mandarine')
provides=('mandarine')
source=("git+https://github.com/mandarine3ds/mandarine"
	"boost::git+https://github.com/PabloMK7/ext-boost.git"
	"git+https://github.com/neobrain/nihstro.git"
	"git+https://codeberg.org/soundtouch/soundtouch.git"
	"catch2::git+https://github.com/catchorg/Catch2"
	"git+https://github.com/lioncash/dynarmic.git"
	"git+https://github.com/herumi/xbyak.git"
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/lsalzman/enet.git"
	"git+https://github.com/benhoyt/inih.git"
	"libressl::git+https://github.com/PabloMK7/ext-libressl-portable.git"
	"git+https://github.com/libusb/libusb.git"
	"git+https://github.com/mozilla/cubeb"
	"git+https://github.com/PabloMK7/discord-rpc.git"
	"git+https://github.com/arun11299/cpp-jwt.git"
	"git+https://github.com/wwylele/teakra.git"
	"git+https://github.com/lvandeve/lodepng.git"
	"git+https://github.com/facebook/zstd.git"
	"git+https://github.com/lemenkov/libyuv.git"
	"sdl2::git+https://github.com/libsdl-org/SDL"
	"git+https://github.com/abdes/cryptopp-cmake.git"
	"git+https://github.com/weidai11/cryptopp.git"
	"git+https://github.com/septag/dds-ktx"
	"git+https://github.com/kcat/openal-soft"
	"git+https://github.com/KhronosGroup/glslang"
	"vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator"
	"vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers"
	"git+https://github.com/PabloMK7/sirit"
	"git+https://github.com/knik0/faad2"
	"library-headers::git+https://github.com/PabloMK7/ext-library-headers.git"
	"git+https://github.com/bylaws/libadrenotools"
	"git+https://github.com/merryhime/oaknut.git"
	"git+https://github.com/google/oboe.git"
	"SPIRV-Tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git"
	"git+https://github.com/google/googletest" # cubeb
	"git+https://github.com/arsenm/sanitizers-cmake" # cubeb
	"git+https://github.com/KhronosGroup/SPIRV-Headers" # sirit
	"git+https://github.com/bylaws/liblinkernsbypass" # libadrenotools
	"https://github.com/username227/mcl/archive/refs/tags/mcl.tar.gz"
	"sv_SE_patch.patch")
sha256sums=('SKIP'
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
            'e1276b22b7be39871f5c1eee1e63365e77f818539113e9a9cb0b30c7165abc6c'
            '22760c3a3704f50e619b8b4592b8c5d3d7dac339aeba48f95138f3596dea00cd')
pkgver() {
    cd "$srcdir/$_pkgname"
    #echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" # Get canary version plus commit
}
prepare() {	
    cd "$srcdir/$_pkgname"
    git submodule init
    for submodule in {boost,nihstro,soundtouch,catch2,dynarmic,xbyak,fmt,enet,inih,libressl,libusb,cubeb,discord-rpc,cpp-jwt,teakra,lodepng,zstd,libyuv,sdl2,cryptopp-cmake,cryptopp,dds-ktx,openal-soft,glslang,vma,vulkan-headers,sirit,faad2,library-headers,libadrenotools,oaknut,SPIRV-Tools};
    do
    git config submodule.${submodule}.url "$srcdir/${submodule}"
    done
    git config submodule.externals/oboe.url "$srcdir/oboe"
    git -c protocol.file.allow=always submodule update
    
    cd "$srcdir/$_pkgname/externals/cubeb"
    git submodule init
    git config submodule.googletest.url "$srcdir/googletest"
    git config submodule."cmake/sanitizers-cmake".url "$srcdir/sanitizers-cmake"
    git -c protocol.file.allow=always submodule update
    
    cd "$srcdir/$_pkgname/externals/sirit/"
    git submodule init
    git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update
    
    cd "$srcdir/$_pkgname/externals/libadrenotools/"
    git submodule init
    git config submodule.lib/linkernsbypass.url "$srcdir/liblinkernsbypass"
    git -c protocol.file.allow=always submodule update

#fix Dynarmic mcl errors
	rm -r $srcdir/$_pkgname/externals/dynarmic/externals/mcl
	mv $srcdir/mcl-mcl $srcdir/$_pkgname/externals/dynarmic/externals/mcl

#fix sv_SE translation parse error
	patch $srcdir/$_pkgname/dist/languages/sv_SE.ts $srcdir/sv_SE_patch.patch
}

build() {
    export CFLAGS=$(echo $CFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    export CXXFLAGS=$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    CXXFLAGS+=" -I/usr/lib/libusb-1.0 -flto=thin"
    CFLAGS+=" -flto=thin"

    cmake -B build -S "$_pkgname" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
    -DENABLE_QT_TRANSLATION=ON \
    -DUSE_DISCORD_PRESENCE=ON \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DUSE_SYSTEM_GLSLANG=OFF \
	-DUSE_SYSTEM_CATCH2=ON \
	-DUSE_SYSTEM_FMT=ON \
	-DUSE_SYSTEM_INIH=ON \
	-DUSE_SYSTEM_JSON=ON \
	-DUSE_SYSTEM_LIBUSB=ON \
	-DUSE_SYSTEM_OPENAL=ON \
	-DUSE_SYSTEM_OPENSSL=ON \
	-DUSE_SYSTEM_SOUNDTOUCH=ON \
	-DUSE_SYSTEM_ZSTD=ON \
	-DUSE_SYSTEM_SDL2=ON \
	-DUSE_SYSTEM_VULKAN_HEADERS=OFF \
	-DUSE_SYSTEM_BOOST=OFF \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-DMANDARINE_WARNINGS_AS_ERRORS=OFF \
	-Wno-dev
    cmake --build build
}
package() {
    DESTDIR="$pkgdir/" cmake --install build
    rm -rf $pkgdir/usr/include/
    rm -rf $pkgdir/usr/lib/
}

#	
#	
#	
#	-DUSE_SYSTEM_BOOST=OFF \
#	
#	
#	
#	
#	
#	
