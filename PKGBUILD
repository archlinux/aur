# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>

pkgname=('angle')
pkgver=7258
pkgrel=3
pkgdesc="A conformant OpenGL ES implementation for Windows, Mac, Linux, iOS and Android."
arch=('x86_64')
url="https://chromium.googlesource.com/angle/angle"
license=('BSD-3-Clause')
depends=('zlib' 'libglvnd' 'freetype2' 'expat' 'libpng' 'libjpeg-turbo' 'fontconfig' 'harfbuzz' 'gcc-libs' 'libwebp' 'glibc')
makedepends=('git' 'rsync' 'python' 'procps-ng' 'ninja')
provides=(angle)
conflicts=(angle)
source=(
    "git+$url#branch=chromium/$pkgver"
    "angle.pc"
    "vk.patch"
    "gclient_args.gni"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {    
    { [ -d angle/build/.git ] || git clone https://chromium.googlesource.com/chromium/src/build.git angle/build; } && git -C angle/build reset --hard 169fcf699b64d2d5e75a391beaec8a7ad6e41a7f
    { [ -d angle/testing/.git ] || git clone https://chromium.googlesource.com/chromium/src/testing angle/testing; } && git -C angle/testing reset --hard 0d5210a4b1978e7e2c6b8623c719dff0a0994a8f
    { [ -d angle/third_party/abseil-cpp/.git ] || git clone https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp angle/third_party/abseil-cpp; } && git -C angle/third_party/abseil-cpp reset --hard e3d58ba1a2a04f85225c3c04fa4603bb64399b2c
    { [ -d angle/third_party/astc-encoder/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/ARM-software/astc-encoder angle/third_party/astc-encoder/src; } && git -C angle/third_party/astc-encoder/src reset --hard 2319d9c4d4af53a7fc7c52985e264ce6e8a02a9b
    { [ -d angle/third_party/EGL-Registry/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/KhronosGroup/EGL-Registry angle/third_party/EGL-Registry/src; } && git -C angle/third_party/EGL-Registry/src reset --hard 7dea2ed79187cd13f76183c4b9100159b9e3e071
    { [ -d angle/third_party/libdrm/src/.git ] || git clone https://chromium.googlesource.com/chromiumos/third_party/libdrm.git angle/third_party/libdrm/src; } && git -C angle/third_party/libdrm/src reset --hard ad78bb591d02162d3b90890aa4d0a238b2a37cde
    { [ -d angle/third_party/jsoncpp/.git ] || git clone https://chromium.googlesource.com/chromium/src/third_party/jsoncpp angle/third_party/jsoncpp; } && git -C angle/third_party/jsoncpp reset --hard f62d44704b4da6014aa231cfc116e7fd29617d2a
    { [ -d angle/third_party/jsoncpp/source/.git ] || git clone https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git angle/third_party/jsoncpp/source; }
    { [ -d angle/third_party/OpenGL-Registry/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenGL-Registry angle/third_party/OpenGL-Registry/src; } && git -C angle/third_party/OpenGL-Registry/src reset --hard 200cea4030cb49d3e40677379e6368a5f0e8c27b
    { [ -d angle/third_party/rapidjson/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/Tencent/rapidjson angle/third_party/rapidjson/src; } && git -C angle/third_party/rapidjson/src reset --hard 781a4e667d84aeedbeb8184b7b62425ea66ec59f
    { [ -d angle/third_party/spirv-headers/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers angle/third_party/spirv-headers/src; } && git -C angle/third_party/spirv-headers/src reset --hard 2a611a970fdbc41ac2e3e328802aed9985352dca
    { [ -d angle/third_party/spirv-tools/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools angle/third_party/spirv-tools/src; } && git -C angle/third_party/spirv-tools/src reset --hard 108b19e5c6979f496deffad4acbe354237afa7d3
    { [ -d angle/third_party/vulkan-headers/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers angle/third_party/vulkan-headers/src; } && git -C angle/third_party/vulkan-headers/src reset --hard 10739e8e00a7b6f74d22dd0a547f1406ff1f5eb9
    { [ -d angle/third_party/vulkan-loader/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader angle/third_party/vulkan-loader/src; } && git -C angle/third_party/vulkan-loader/src reset --hard c8a2c8c9164a58ce71c1c77104e28e8de724539e
    { [ -d angle/third_party/vulkan-tools/src/.git ] || git clone https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools angle/third_party/vulkan-tools/src; } && git -C angle/third_party/vulkan-tools/src reset --hard e3fc64396755191b3c51e5c57d0454872e7fa487
    { [ -d angle/third_party/vulkan_memory_allocator/.git ] || git clone https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator angle/third_party/vulkan_memory_allocator; } && git -C angle/third_party/vulkan_memory_allocator reset --hard 56300b29fbfcc693ee6609ddad3fdd5b7a449a21
    { [ -d angle/third_party/zlib/.git ] || git clone https://chromium.googlesource.com/chromium/src/third_party/zlib angle/third_party/zlib; } && git -C angle/third_party/zlib reset --hard 4028ebf8710ee39d2286cb0f847f9b95c59f84d8

    cp gclient_args.gni angle/build/config
    cd angle
    patch src/libANGLE/renderer/vulkan/vk_cache_utils.cpp <"$srcdir/vk.patch"
    gn gen out/Release --args="
        angle_build_tests=false
        angle_enable_abseil=true
        angle_enable_renderdoc=false
        angle_enable_swiftshader=false
        angle_enable_vulkan=true
        angle_enable_wgpu=false
        angle_expose_non_conformant_extensions_and_versions=true
        angle_use_wayland=true
        angle_use_x11=false
        build_angle_deqp_tests=false
        build_with_chromium=false
        chrome_pgo_phase=0
        is_cfi=false
        is_component_build=false
        is_clang=false
        is_debug=false
        is_official_build=true
        treat_warnings_as_errors=false
        use_custom_libcxx=false
        use_safe_libstdcxx=true
        use_siso=false
        use_sysroot=false
    "
}

build() {
    cd angle
    ninja -C ./out/Release
}

package() {
    cd "$srcdir/angle"

    # License
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Library
    libs=(
	libEGL
        libEGL_vulkan_secondaries
        libGLESv1_CM
        libGLESv2
        libGLESv2_vulkan_secondaries
        libGLESv2_with_capture
        libVkICD_mock_icd
        libfeature_support
    )
    for lib in "${libs[@]}"; do
        install -D -m644 "out/Release/$lib.so" "$pkgdir/opt/angle/usr/lib/$lib.so"
    done

    # Headers
    find include -type f -and -name "*.h" -exec install -v -D -m644 {} "$pkgdir/opt/angle/usr/"{} \; -print

    install -D -m644 "$srcdir/angle.pc" "$pkgdir/usr/lib/pkgconfig/angle.pc"

    git reset --hard origin/main
}


