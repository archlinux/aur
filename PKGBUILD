# Maintainer: jvyden <jvyden@jvyden.xyz>
# Contributor: Logan Lowe <me@loganl.net>
# Contributor: Beyley Thomas <ep1cm1n10n123@gmail.com>

pkgbase=lib32-mesa-amd-bc250
pkgname=(
  lib32-mesa-amd-bc250
  lib32-vulkan-radeon-amd-bc250
)
pkgver=24.2.3
pkgrel=1
epoch=1
pkgdesc="Open-source OpenGL drivers with amdgpu fixes for the AMD BC-250 - 32-bit"
url="https://www.mesa3d.org/"
arch=(x86_64)
license=("MIT AND BSD-3-Clause AND SGI-B-2.0")
makedepends=(
  lib32-clang
  lib32-expat
  lib32-gcc-libs
  lib32-glibc
  lib32-libdrm
  lib32-libelf
  lib32-libglvnd
  lib32-libva
  lib32-libvdpau
  lib32-libx11
  lib32-libxcb
  lib32-libxext
  lib32-libxfixes
  lib32-libxml2
  lib32-libxrandr
  lib32-libxshmfence
  lib32-libxxf86vm
  lib32-llvm
  lib32-llvm-libs
  lib32-lm_sensors
  lib32-rust-libs
  lib32-spirv-llvm-translator
  lib32-spirv-tools
  lib32-systemd
  lib32-vulkan-icd-loader
  lib32-wayland
  lib32-xcb-util-keysyms
  lib32-zlib
  lib32-zstd

  # shared between mesa and lib32-mesa
  cbindgen
  clang
  cmake
  elfutils
  glslang
  libclc
  meson
  python-mako
  python-packaging
  python-ply
  python-yaml
  rust-bindgen
  wayland-protocols
  xorgproto
)
options=(
  # GCC 14 LTO causes segfault in LLVM under si_llvm_optimize_module
  # https://gitlab.freedesktop.org/mesa/mesa/-/issues/11140
  #
  # In general, upstream considers LTO to be broken until explicit notice.
  !lto
)
source=(
  "https://mesa.freedesktop.org/archive/mesa-$pkgver.tar.xz"{,.sig}
  0001-adjust-navi10-range.patch
)
validpgpkeys=(
  946D09B5E4C9845E63075FF1D961C596A7203456 # Andres Gomez <tanty@igalia.com>
  71C4B75620BC75708B4BDB254C95FAAB3EB073EC # Dylan Baker <dylan@pnwbakers.com>
  8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D # Emil Velikov <emil.l.velikov@gmail.com>
  57551DE15B968F6341C248F68D8E31AFC32428A6 # Eric Engestrom <eric@engestrom.ch>
  A5CC9FEC93F2F837CB044912336909B6B25FADFA # Juan A. Suarez Romero <jasuarez@igalia.com>
  E3E8F480C52ADD73B278EE78E1ECBE07D7D70895 # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
)

# Rust crates for NVK, used as Meson subprojects
declare -A _crates=(
   equivalent      1.0.1
   hashbrown       0.14.1
   indexmap        2.2.6
   once_cell       1.8.0
   paste           1.0.14
   pest            2.7.11
   pest_derive     2.7.11
   pest_generator  2.7.11
   pest_meta       2.7.11
   proc-macro2     1.0.86
   quote           1.0.33
   roxmltree       0.20.0
   syn             2.0.68
   ucd-trie        0.1.6
   unicode-ident   1.0.12
)

for _crate in "${!_crates[@]}"; do
  _ver="${_crates[$_crate]}"
  source+=(
    "$_crate-$_ver.tar.gz::https://crates.io/api/v1/crates/$_crate/$_ver/download"
  )
done

sha256sums=('4ea18b1155a4544a09f7361848974768f6f73c19d88f63de2ec650be313b2d0c'
            'SKIP'
            '501661a0b2d2f3443986a01b9ef58fba0be1ca75c54d269b1269254a3c87f605'
            'ed646292ffc8188ef8ea4d1e0e0150fb15a5c2e12ad9b8fc191ae7a8a7f3c4b9'
            'a941429fea7e08bedec25e4f6785b6ffaacc6b755da98df5ef3e7dcf4a124c4f'
            '168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26'
            '7dfda62a12f55daeae5015f81b0baea145391cb4520f86c248fc615d72640d12'
            '5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77'
            '2a548d2beca6773b1c244554d36fcf8548a8a58e74156968211567250e48e49a'
            '3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b'
            '5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae'
            '6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97'
            'de3145af08024dea9fa9914f381a17b8fc6034dfb00f3a84013f7ff43f29ed4c'
            'cd53dff83f26735fdc1ca837098ccf133605d794cdae66acfc2bfac3ec809d95'
            '5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5'
            '3c93a82e8d145725dcbaf44e5ea887c8a869efdcc28706df2d08c69e17077183'
            '692fcb63b64b1758029e0a96ee63e049ce8c5948587f2f7208df04625e5f6b56'
            '901fa70d88b9d6c98022e23b4136f9f3e54e4662c3bc1bd1d84a42a9a0f0c1e9')
b2sums=('3c480bd9f5948ae4d66a833cfc059b1b872fca989296a070deaa46aeb72298eaca6a3fa9d13574859623cec4a6af978f44d2c9562b9757be2257364c27600be6'
        'SKIP'
        '9f6dbb22a5ade8baec0cbd683c86da77ef66cd64f8a5d464965703e7da8cf2357bc0c0cf1b2196feb1000c465a10f3aa352eb5bd2fab3c9ffb72a8a70e8dee5d'
        'a6d47c903be6094423d89b8ec3ca899d0a84df6dbd6e76632bb6c9b9f40ad9c216f8fa400310753d392f85072756b43ac3892e0a2c4d55f87ab6463002554823'
        '9c34f1ab14ad5ae124882513e0f14b1d731d06a43203bdc37fa3b202dd3ce93dbe8ebb554d01bab475689fe6ffd3ec0cbc0d5365c9b984cb83fb34ea3e9e732e'
        'fac5cf6339dc3c0a40b100035a5c874cc7b2efeafeb31c51488d25156e392dc9db86a497e76eead351d2126f69d060422faa9c55d73407a0de9f5be18d234123'
        'afa9268513caa93fb141e69d27e7d65e72b9232b57d91e499f36ea4ec89d65bc6c8cbb37753ed59d149be5a2d349028b1fb0414c6223914366d6f3f31619855f'
        '4b89e07f23af8328dbb34fe2b3f1b202f1e6a3885a6269740a23359b41bb4099ac2484565d3b2b0936261689ca525785ac620c766997234fd8d0f409e80e5ea3'
        'e81ed8b60492da9612d2208c6cfa712ebf8c6ed7993642bfc4fadeaba10a0bc16700bce012d34d955104041ed8bbf659d16d9b86eab52342875d4c6148e7f60d'
        '4cede03c08758ccd6bf53a0d0057d7542dfdd0c93d342e89f3b90460be85518a9fd24958d8b1da2b5a09b5ddbee8a4263982194158e171c2bba3e394d88d6dac'
        '77c4b166f1200e1ee2ab94a5014acd334c1fe4b7d72851d73768d491c56c6779a0882a304c1f30c88732a6168351f0f786b10516ae537cff993892a749175848'
        '9605ca407af248c71e0d2bc24d213aa6ff08a14eb548b85de16de7e172a617cdf12c2e4c686f6dd1c80455448a313f6e7d760885f189ae726934efbe06fb5603'
        '35e8548611c51ee75f4d04926149e5e54870d7073d9b635d550a6fa0f85891f57f326bdbcff3dd8618cf40f8e08cf903ef87d9c034d5921d8b91e1db842cdd7c'
        '23bb1f3453d5d839dba7b3292806eb2d327ccafb1b1472fd970262a44c0abbabfbf3316ca16dd5526177bcb67a701cf79fa86b68fd1e57a3d875cb4b7ff89ad9'
        '302d78069d9df05e78b53f0488a9e4eb98fa2bc1e21893dc8a0acf2234347ba7c4df4b9d6b380ae77d8ffb1074b9c790460fe2dae47318aa1c4fe4208244540a'
        'dd65c69d8d0ff343d36e31e6a4f4e11aeb01b1fd23d0db06d90f506ec2f2bb2c50422f6a73b48780e16e07c8d0addb374dd09cfabaf6230d5b2ba409dd3fa6cd'
        '7681b1a7497b5711e663773c1a7e076f333c06c10d3f289079a781c36f050c1620cc279742ea8e5b15ec48f3d6038a6079bbda7fee3ae8e1128bd916d53ed43a'
        '8bc6f68ed286bea617a2cfaf3949bb699d3a0466faeca735314a51596ce950e4ee57eda88154bd562c1728cfaff4cdb5bc1ba701b9d47a9c50d4c4f011bee975')

prepare() {
  cd mesa-$pkgver

  patch -Np1 -i ../0001-adjust-navi10-range.patch

  # Include package release in version string so Chromium invalidates
  # its GPU cache; otherwise it can cause pages to render incorrectly.
  # https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/2020604
  echo "$pkgver-arch$epoch.$pkgrel" >VERSION
}

build() {
  local meson_options=(
    --cross-file lib32
    -D android-libbacktrace=disabled
    -D b_ndebug=true
    -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,llvmpipe,softpipe,iris,crocus,i915,zink
    -D gallium-extra-hud=true
    -D gallium-nine=true
    -D gallium-omx=disabled
    -D gallium-opencl=icd
    -D gallium-rusticl=true
    -D gles1=disabled
    -D glx=dri
    -D html-docs=disabled
    -D intel-clc=enabled
    -D intel-rt=disabled
    -D libunwind=disabled
    -D microsoft-clc=disabled
    -D osmesa=true
    -D platforms=x11,wayland
    -D valgrind=disabled
    -D video-codecs=all
    -D vulkan-drivers=amd,intel,intel_hasvk,nouveau,swrast,virtio
    -D vulkan-layers=device-select,intel-nullhw,overlay
  )

  export BINDGEN_EXTRA_CLANG_ARGS="-m32"

  # Build only minimal debug info to reduce size
  CFLAGS+=" -g1"
  CXXFLAGS+=" -g1"

  # Inject subproject packages
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson mesa-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv -v "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_lib32-mesa-amd-bc250() {
  depends=(
    lib32-expat
    lib32-gcc-libs
    lib32-glibc
    lib32-libdrm
    lib32-libelf
    lib32-libglvnd
    lib32-libx11
    lib32-libxcb
    lib32-libxext
    lib32-libxfixes
    lib32-libxshmfence
    lib32-libxxf86vm
    lib32-llvm-libs
    lib32-lm_sensors
    lib32-wayland
    lib32-zlib
    lib32-zstd

    mesa
  )
  optdepends=("opengl-man-pages: for the OpenGL API man pages")
  provides=(
    lib32-mesa
    lib32-mesa-libgl
    lib32-opengl-driver
  )
  conflicts=(
    lib32-mesa
    lib32-mesa-libgl
  )
  replaces=(lib32-mesa-libgl)

  meson install -C build --destdir "$pkgdir"

  (
    local libdir=usr/lib32 icddir=usr/share/vulkan/icd.d

    cd "$pkgdir"

    _pick libva $libdir/dri/*_drv_video.so

    _pick vdpau $libdir/vdpau

    _pick clover $libdir/gallium-pipe
    _pick clover $libdir/libMesaOpenCL*

    _pick clrust $libdir/libRusticlOpenCL*

    _pick vkintel $icddir/intel_*.json
    _pick vkintel $libdir/libvulkan_intel*.so

    _pick vklayer $libdir/libVkLayer_*.so

    _pick vknvidia $icddir/nouveau_*.json
    _pick vknvidia $libdir/libvulkan_nouveau*.so

    _pick vkradeon $icddir/radeon_icd*.json
    _pick vkradeon $libdir/libvulkan_radeon.so

    _pick vkswrast $icddir/lvp_icd*.json
    _pick vkswrast $libdir/libvulkan_lvp.so

    _pick vkvirtio $icddir/virtio_icd*.json
    _pick vkvirtio $libdir/libvulkan_virtio.so

    rm -rv etc usr/{bin,include,share}

    # indirect rendering
    ln -sr $libdir/libGLX_{mesa,indirect}.so.0
  )

  install -Dm644 mesa-$pkgver/docs/license.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_lib32-vulkan-radeon-amd-bc250() {
  pkgdesc="Open-source Vulkan driver for AMD GPUs with fixes for the AMD BC-250 - 32-bit"
  depends=(
    lib32-expat
    lib32-gcc-libs
    lib32-glibc
    lib32-libdrm
    lib32-libelf
    lib32-libx11
    lib32-libxcb
    lib32-libxshmfence
    lib32-llvm-libs
    lib32-systemd
    lib32-vulkan-icd-loader
    lib32-wayland
    lib32-xcb-util-keysyms
    lib32-zlib
    lib32-zstd

    vulkan-radeon
  )
  optdepends=("lib32-vulkan-mesa-layers: additional vulkan layers")
  conflicts=(
    lib32-vulkan-radeon
  )
  provides=(
    lib32-vulkan-radeon
    lib32-vulkan-driver
  )

  mv vkradeon/* "$pkgdir"

  install -Dm644 mesa-$pkgver/docs/license.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
