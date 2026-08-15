# Maintainer: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgname=mesa-git
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=26.3.0_devel.228038.f0bcf544881.d41d8cd
pkgrel=1
arch=('x86_64')
makedepends=(
    'git'
    'xorgproto'
    'libxml2'
    'libva'
    'elfutils'
    'libxrandr'
    'meson'
    'ninja'
    'glslang'
    'directx-headers'
    'python'
    'python-mako'
    'python-ply'
    'cbindgen'
    'wayland-protocols'
    'python-packaging'
    'python-pyaml'
)
depends=(
    'libdrm'
    'libxxf86vm'
    'libxdamage'
    'libxshmfence'
    'libelf'
    'libunwind'
    'libglvnd'
    'wayland'
    'lm_sensors'
    'vulkan-icd-loader'
    'zstd'
    'expat'
    'gcc-libs'
    'libxfixes'
    'libx11'
    'systemd-libs'
    'libxext'
    'libxcb'
    'glibc'
    'zlib'
    'xcb-util-keysyms'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
    'vulkan-mesa-layers'
    'opencl-driver'
    'opengl-driver'
    'vulkan-driver'
    'vulkan-intel'
    'vulkan-nouveau'
    'vulkan-radeon'
    'vulkan-swrast'
    'vulkan-virtio'
    'libva-mesa-driver'
    'mesa-libgl'
    'mesa'
    'vulkan-mesa-device-select'
    'vulkan-mesa-implicit-layers'
)
conflicts=(
    'vulkan-mesa-layers'
    'opencl-clover-mesa'
    'vulkan-intel'
    'vulkan-nouveau'
    'vulkan-radeon'
    'vulkan-swrast'
    'vulkan-virtio'
    'libva-mesa-driver'
    'mesa-libgl'
    'mesa'
    'vulkan-mesa-device-select'
    'vulkan-mesa-implicit-layers'
)
url="https://www.mesa3d.org"
license=('custom')
# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29275
source=(
    'mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main'
    'LICENSE'
    "venus-protocol-1.1::git+https://gitlab.freedesktop.org/virgl/venus-protocol.git"
)
sha256sums=('SKIP'
            '7fdc119cf53c8ca65396ea73f6d10af641ba41ea1dd2bd44a824726e01c8b3f2'
            'SKIP'
            '357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d'
            '5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77'
            '3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b'
            '291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef'
            'de3145af08024dea9fa9914f381a17b8fc6034dfb00f3a84013f7ff43f29ed4c'
            '25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d')
b2sums=('SKIP'
        'cc60238726b35133b5b729fb4ed1e76e04136588533615d84b4a54656d5b41727d5e7ff06ef4de3eb102eed6669d6c5c5cb8ac9fbdf6fc25aa477877c5c3ba87'
        'SKIP'
        '7a1b3b82bbbf6a123512815c3e8f068a17890cbbb8b68e88a5a492f62469942fadd776207eebd913052a1c06e1fd37a549e86526b9fc8f08b9ca7cb0044ac16b'
        '4b89e07f23af8328dbb34fe2b3f1b202f1e6a3885a6269740a23359b41bb4099ac2484565d3b2b0936261689ca525785ac620c766997234fd8d0f409e80e5ea3'
        '4cede03c08758ccd6bf53a0d0057d7542dfdd0c93d342e89f3b90460be85518a9fd24958d8b1da2b5a09b5ddbee8a4263982194158e171c2bba3e394d88d6dac'
        '81424245e1e2b94459df68bb3a9a866c6a364102b5e1d010ede9c5f8278f8406d7b651957d091c5914e936b494b0f6e9a6a1dd8b7d35cd7d7100f86dee4ec12e'
        '35e8548611c51ee75f4d04926149e5e54870d7073d9b635d550a6fa0f85891f57f326bdbcff3dd8618cf40f8e08cf903ef87d9c034d5921d8b91e1db842cdd7c'
        '93385f64103fdb482bec34c7912474ae7a5935948715e6eb9a54907e0db5c39f089f6cd393bab33c935c59a1bbb0f4099431f206343811c1a450554d96a35756')


options=(!lto !debug)
# lto and debug are disabled manually through meson -D flags, but it feels cleaner to also list them here.

# Rust crates for NVK, used as Meson subprojects
declare -A _crates=(
  proc-macro2     1.0.86
  quote           1.0.35
  syn             2.0.87
  unicode-ident   1.0.12
  paste           1.0.14
  rustc-hash      2.1.1
)

for _crate in "${!_crates[@]}"; do
  source+=($_crate-${_crates[$_crate]}.tar.gz::https://static.crates.io/crates/$_crate/${_crates[$_crate]}/download)
done

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

# MESA_WHICH_LLVM is an environment variable that determines which llvm package tree is used to built mesa-git against.
# Adding a line to ~/.bashrc  that sets this value is the simplest way to ensure a specific choice.
#
# NOTE: Aur helpers don't handle this method well, check the sticky comments on mesa-git aur page .
#
# 1: llvm-minimal-git (aur) preferred value
# 2: AUR llvm-git
# 3: llvm-git from LordHeavy unofficial repo 
# 4  llvm (stable from extra) Default value
#

_rusticl=false
MESA_WHICH_LLVM=${MESA_WHICH_LLVM:-4}

case $MESA_WHICH_LLVM in
    1)
        # aur llvm-minimal-git
        _rusticl=true
        makedepends+=(
            'llvm-minimal-git'
            'libclc-minimal-git'
            'spirv-llvm-translator-minimal-git'
            'clang-minimal-git'
            'clang-opencl-headers-minimal-git'
            'rust'
            'rust-bindgen'
            'spirv-tools'
            'glslang'
        )
        depends+=(
            'llvm-libs-minimal-git'
            'spirv-llvm-translator-minimal-git'
            'libclc-minimal-git'
            'spirv-tools'
            'clang-libs-minimal-git'
            'clang-opencl-headers-minimal-git'
        )
        conflicts+=('opencl-rusticl-mesa')
        provides+=('opencl-rusticl-mesa')
        ;;
    2)
        # aur llvm-git
        # depending on aur-llvm-* to avoid mixup with LH llvm-git
        makedepends+=(
            'aur-llvm-git'
            'libclc-git'
            'spirv-llvm-translator-git'
            'clang-git'
            'clang-opencl-headers-git'
        )
        depends+=('aur-llvm-libs-git')
        optdepends+=('aur-llvm-git: opencl')
        ;;
    3)
        # mesa-git/llvm-git (lordheavy unofficial repo)
        makedepends+=(
            'llvm-git'
            'clang-git'
            'libclc-git'
            'spirv-tools'
            'spirv-llvm-translator-git'
        )
        depends+=('llvm-libs-git')
        optdepends+=('clang-git: opencl' 'compiler-rt: opencl')
        ;;
    4)
        # extra/llvm
        makedepends+=(
            'llvm'
            'clang'
            'libclc'
            'spirv-llvm-translator'
            'spirv-tools'
            'rust'
            'rust-bindgen'
        )
        depends+=(
            'libLLVM.so=22.1-64'
            'clang'
            'libclc'
            'spirv-llvm-translator'
            'spirv-tools'
        )
        conflicts+=('opencl-rusticl-mesa')
        provides+=('opencl-rusticl-mesa')
        _rusticl=true
        ;;
    *)
esac

pkgver() {
    cd mesa
    local _ver
    _ver=$(<VERSION)

    local _patchver
    local _patchfile
    for _patchfile in "${source[@]}"; do
        _patchfile="${_patchfile%%::*}"
        _patchfile="${_patchfile##*/}"
        [[ $_patchfile = *.patch ]] || continue
        _patchver="${_patchver}$(md5sum ${srcdir}/${_patchfile} | cut -c1-32)"
    done
    _patchver="$(echo -n $_patchver | md5sum | cut -c1-7)"

    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD).${_patchver}
}

prepare() {
    # although removing _build folder in build() function feels more natural,
    # that interferes with the spirit of makepkg --noextract
    if [  -d _build ]; then
        rm -rf _build
    fi

    local _patchfile
    for _patchfile in "${source[@]}"; do
        _patchfile="${_patchfile%%::*}"
        _patchfile="${_patchfile##*/}"
        [[ $_patchfile = *.patch ]] || continue
        echo "Applying patch $_patchfile..."
        patch --directory=mesa --forward --strip=1 --input="${srcdir}/${_patchfile}"
    done
}

build () {
    local meson_options=(
        -D android-libbacktrace=disabled
        -D b_ndebug=true
        -D b_lto=false
        -D egl=enabled
        -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,softpipe,llvmpipe,i915,iris,crocus,zink
        -D gallium-extra-hud=true
        -D gallium-rusticl=${_rusticl}
        -D gallium-va=enabled
        -D gbm=enabled
        -D gles1=disabled
        -D gles2=enabled
        -D glvnd=enabled
        -D glx=dri
        -D libunwind=enabled
        -D llvm=enabled
        -D lmsensors=enabled
        -D microsoft-clc=disabled
        -D platforms=x11,wayland
        -D valgrind=disabled
        -D video-codecs=all
        -D vulkan-drivers=amd,intel,intel_hasvk,swrast,virtio,nouveau
        -D vulkan-layers=device-select,intel-nullhw,overlay,anti-lag
        -D tools=[]
        -D zstd=enabled
        -D buildtype=plain
        --wrap-mode=nofallback
        --force-fallback-for=syn,paste,rustc-hash,venus-protocol
        -D prefix=/usr
        -D sysconfdir=/etc
        -D legacy-x11=dri2
    )

    # Build only minimal debug info to reduce size
    CFLAGS+=' -g1'
    CXXFLAGS+=' -g1'

    # Inject subproject packages so meson won't re-download them
    export MESON_PACKAGE_CACHE_DIR="$srcdir"

    meson setup mesa _build "${meson_options[@]}"
    meson configure --no-pager _build
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    rmdir "${pkgdir}/usr/bin"

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
 
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
