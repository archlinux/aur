# DEPRECATED: see bailout() below
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# mesa-rdna2vr Maintainer: hypevhs <hackgammavision@gmail.com>

pkgbase=mesa-rdna2vr
pkgname=(
  mesa-rdna2vr
  vulkan-radeon-rdna2vr
)
pkgver=26.0.5
_pkgver=${pkgver/[a-z]/-&}
pkgrel=1
epoch=1
pkgdesc="Open-source OpenGL drivers - RDNA 2 VR fixes"
url="https://www.mesa3d.org/"
arch=(x86_64)
license=("MIT AND BSD-3-Clause AND SGI-B-2.0")
makedepends=(
  # clang
  # directx-headers
  # expat
  # glibc
  # libdisplay-info
  # libdrm
  # libelf
  # libgcc
  # libglvnd
  # libpng
  # libstdc++
  # libva
  # libx11
  # libxcb
  # libxext
  # libxml2
  # libxrandr
  # libxshmfence
  # libxxf86vm
  # llvm
  # llvm-libs
  # lm_sensors
  # rust
  # spirv-llvm-translator
  # spirv-tools
  # systemd-libs
  # vulkan-icd-loader
  # wayland
  # xcb-util-keysyms
  # zlib
  # zstd
  #
  # # shared between mesa and lib32-mesa
  # cbindgen
  # clang
  # cmake
  # elfutils
  # glslang
  # libclc
  # meson
  # python-mako
  # python-packaging
  # python-ply
  # python-pycparser
  # python-yaml
  # rust-bindgen
  # wayland-protocols
  # xorgproto
  #
  # # mesa-only deps
  # libsysprof-capture
  # valgrind
)
options=(
  # GCC 14 LTO causes segfault in LLVM under si_llvm_optimize_module
  # https://gitlab.freedesktop.org/mesa/mesa/-/issues/11140
  #
  # In general, upstream considers LTO to be broken until explicit notice.
  !lto
)
source=(
  # "https://archive.mesa3d.org/mesa-$_pkgver.tar.xz"{,.sig}

  # Fix build on i686
  0001-kk-Fix-debug-printf-specifier.patch
  # Fix DRM lease of wired VR HMDs on RDNA 2, see https://gitlab.freedesktop.org/mesa/mesa/-/issues/15025
  0001-Revert-wsi-display-pass-the-plane-s-modifiers-to-the.patch
)
validpgpkeys=(
  946D09B5E4C9845E63075FF1D961C596A7203456 # Andres Gomez <tanty@igalia.com>
  71C4B75620BC75708B4BDB254C95FAAB3EB073EC # Dylan Baker <dylan@pnwbakers.com>
  8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D # Emil Velikov <emil.l.velikov@gmail.com>
  57551DE15B968F6341C248F68D8E31AFC32428A6 # Eric Engestrom <eric@engestrom.ch>
  A5CC9FEC93F2F837CB044912336909B6B25FADFA # Juan A. Suarez Romero <jasuarez@igalia.com>
  E3E8F480C52ADD73B278EE78E1ECBE07D7D70895 # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
)

# # Rust crates for NVK, used as Meson subprojects
# declare -A _crates=(
#   bitflags         2.9.1
#   cfg-if           1.0.0
#   equivalent       1.0.1
#   errno            0.3.12
#   hashbrown        0.14.1
#   indexmap         2.2.6
#   libc             0.2.171
#   log              0.4.27
#   once_cell        1.8.0
#   paste            1.0.14
#   pest             2.8.0
#   pest_derive      2.8.0
#   pest_generator   2.8.0
#   pest_meta        2.8.0
#   proc-macro2      1.0.86
#   quote            1.0.35
#   remain           0.2.12
#   roxmltree        0.20.0
#   rustc-hash       2.1.1
#   rustix           1.1.2
#   syn              2.0.87
#   thiserror        2.0.11
#   thiserror-impl   2.0.11
#   ucd-trie         0.1.6
#   unicode-ident    1.0.12
#   windows-link     0.2.0
#   windows-sys      0.61.1
#   zerocopy         0.8.13
#   zerocopy-derive  0.8.13
# )
#
# # Used to generate the above table
# _gencrates() {
#   grep '^source_url' subprojects/*-rs.wrap | \
#     sed -r 's|.*crates/([^/]+)/([0-9.]+)/download|\1 \2|' | \
#     column -t -S 2 | sed 's/^/  /'
# }
#
# for _crate in "${!_crates[@]}"; do
#   _ver="${_crates[$_crate]}"
#   source+=(
#     "$_crate-$_ver.tar.gz::https://crates.io/api/v1/crates/$_crate/$_ver/download"
#   )
# done

b2sums=('cc21d419a6f60c13cb0da7e3ec0cc741759e3c17afc79b0d8def35159e8584ed94580afac83ab5fbba6158c7eb1999470a4650bfc532bd4343be2166d85aa571'
        '5341f5301580540d6a18d3d119452332aa44259a5f0546cef9cb083b7ee2af38be69490729d28ecb01b70338a93a3e3be053f50a450f299af26e995cc477a2bb')

# https://docs.mesa3d.org/relnotes.html
sha256sums=('46191b06854b253fac666fb201063a42c1c793a5eb9ae88614b743291e076d2e'
            '8d92e55b640b2ebf79a0b9731c8e379c60f356b3d01dae8daa5f8f0d1fbfa161')

bailout() {
  error "
These packages 'mesa-rdna2vr' and 'vulkan-radeon-rdna2vr' are no longer necessary for AMD RDNA 2 cards to use wired VR. Instead, a better workaround exists:
1. Install 'mesa' and 'vulkan-radeon', replacing these custom packages.
2. Set 'RADV_DEBUG=nodisplaydcc %%command%%' as the 'XR Service Launch Options' in your Envision development profile.
Consult the Linux VR Adventures community for help.
"
  exit 1
}

prepare() {
  bailout
  exit 1

  cd mesa-$_pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Include package release in version string so Chromium invalidates
  # its GPU cache; otherwise it can cause pages to render incorrectly.
  # https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/2020604
  echo "$_pkgver-arch$epoch.$pkgrel" >VERSION
}

build() {
  bailout
  exit 1

  local meson_options=(
    -D amdgpu-virtio=true
    -D android-libbacktrace=disabled
    -D b_ndebug=true
    -D freedreno-kmds=msm,virtio
    -D gallium-drivers=all
    -D gallium-extra-hud=true
    -D gallium-mediafoundation=disabled
    -D gallium-rusticl-enable-drivers=radeonsi
    -D gallium-rusticl=true
    -D gles1=disabled
    -D html-docs=disabled
    -D intel-rt=enabled
    -D libunwind=disabled
    -D microsoft-clc=disabled
    -D sysprof=true
    -D valgrind=enabled
    -D video-codecs=all
    -D vulkan-drivers=amd
    -D vulkan-layers=device-select,intel-nullhw,overlay,screenshot,anti-lag,vram-report-limit
    -D vulkan-manifest-per-architecture=false
  )

  # Build only minimal debug info to reduce size
  CFLAGS+=" -g1"
  CXXFLAGS+=" -g1"

  # Inject subproject packages
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson mesa-$_pkgver build "${meson_options[@]}"
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

package_mesa-rdna2vr() {
  bailout
  exit 1

  depends=(
    # expat
    # glibc
    # libdrm
    # libelf
    # libgcc
    # libglvnd
    # libstdc++
    # libx11
    # libxcb
    # libxext
    # libxshmfence
    # libxxf86vm
    # llvm-libs
    # lm_sensors
    # spirv-tools
    # wayland
    # zlib
    # zstd
  )
  optdepends=("opengl-man-pages: for the OpenGL API man pages")
  provides=(
    "libva-mesa-driver=$epoch:$pkgver-$pkgrel"
    "mesa-libgl=$epoch:$pkgver-$pkgrel"
    libva-driver
    opengl-driver
    mesa
  )
  conflicts=(
    'libva-mesa-driver<1:24.2.7-1'
    'mesa-libgl<17.0.1-2'
    mesa
  )
  replaces=(
    'libva-mesa-driver<1:24.2.7-1'
    'mesa-libgl<17.0.1-2'
  )

  meson install -C build --destdir "$pkgdir" --no-rebuild

  (
    local libdir=usr/lib

    cd "$pkgdir"

    _pick opencl $libdir/libRusticlOpenCL*
    _pick opencl etc/OpenCL/vendors/rusticl.icd

    _pick vkradeon $libdir/libvulkan_radeon.so
    _pick vkradeon usr/share/drirc.d/00-radv-defaults.conf
    _pick vkradeon usr/share/vulkan/icd.d/radeon_icd.json

    _pick vkdevice $libdir/libVkLayer_MESA_anti_lag.so
    _pick vkdevice $libdir/libVkLayer_MESA_device_select.so
    _pick vkdevice usr/share/vulkan/implicit_layer.d

    _pick vklayer $libdir/libVkLayer_*.so
    _pick vklayer usr/bin/mesa-*-control.py
    _pick vklayer usr/share/vulkan/explicit_layer.d

    # indirect rendering
    ln -sr $libdir/libGLX_{mesa,indirect}.so.0
  )

  install -Dm644 mesa-$_pkgver/docs/license.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_vulkan-radeon-rdna2vr() {
  bailout
  exit 1

  pkgdesc="Open-source Vulkan driver for AMD GPUs - RDNA 2 VR fixes"
  depends=(
    # expat
    # glibc
    # libdisplay-info
    # libdrm
    # libelf
    # libgcc
    # libstdc++
    # libx11
    # libxcb
    # libxshmfence
    # llvm-libs
    # spirv-tools
    # systemd-libs
    # vulkan-icd-loader
    # vulkan-mesa-implicit-layers
    # wayland
    # xcb-util-keysyms
    # zlib
    # zstd
  )
  optdepends=("vulkan-mesa-layers: additional vulkan layers")
  conflicts=(vulkan-radeon)
  provides=(vulkan-driver vulkan-radeon)
  replaces=('amdvlk<=2025.Q2.1-1')

  mv vkradeon/* "$pkgdir"

  install -Dm644 mesa-$_pkgver/docs/license.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
