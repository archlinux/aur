# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>
# Contributor: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: anon@sansorgan.es
# Contributor: heavysink <winstonwu91 at gmail>

pkgname=proton
_srctag=6.3-8c
_commit=
pkgver=${_srctag//-/.}
pkgver=6.3.8
_geckover=2.47.2
_monover=6.4.1
_asyncver=1.9.2
pkgrel=4
epoch=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components"
url="https://github.com/ValveSoftware/Proton"
arch=(x86_64 x86_64_v3)
options=(!staticlibs !lto emptydirs)
license=('custom')

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  'sdl2>=2.0.16'   'lib32-sdl2>=2.0.16'
  desktop-file-utils
  python
  steam-native-runtime
)

makedepends=(autoconf ncurses bison perl fontforge flex mingw-w64-gcc
  git wget rsync mingw-w64-tools lld nasm meson cmake python-virtualenv python-pip
  glslang vulkan-headers
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  'sdl2>=2.0.16'        'lib32-sdl2>=2.0.16'
  libcups               lib32-libcups
  rust                  lib32-rust-libs
  sane
  libgphoto2
  gsm
  ffmpeg
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sane
  libgphoto2
  gsm
  ffmpeg
  cups
  samba           dosbox
)

makedepends=(${makedepends[@]} ${depends[@]})
provides=('proton-native')
conflicts=('proton-native')
#install=${pkgname}.install
source=(
    proton::git+https://github.com/ValveSoftware/Proton.git#tag=proton-${_srctag}
    wine-valve::git+https://github.com/ValveSoftware/wine.git
    dxvk-valve::git+https://github.com/ValveSoftware/dxvk.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
    gstreamer::git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git
    gst-plugins-base::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git
    gst-plugins-good::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good.git
    gst-orc::git+https://gitlab.freedesktop.org/gstreamer/orc.git
    vkd3d-proton::git+https://github.com/HansKristian-Work/vkd3d-proton.git
    OpenXR-SDK::git+https://github.com/KhronosGroup/OpenXR-SDK.git
    dxvk-nvapi::git+https://github.com/jp7677/dxvk-nvapi.git
    dxil-spirv::git+https://github.com/HansKristian-Work/dxil-spirv.git
    SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git
    Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    vkd3d-zfigura::git+https://repo.or.cz/vkd3d/zf.git
    https://dl.winehq.org/wine/wine-gecko/${_geckover}/wine-gecko-${_geckover}-x86{,_64}.tar.xz
    https://github.com/madewokherd/wine-mono/releases/download/wine-mono-${_monover}/wine-mono-${_monover}-x86.tar.xz
    dxvk-async-${_asyncver}.patch::https://raw.githubusercontent.com/Sporif/dxvk-async/${_asyncver}/dxvk-async.patch
    wine-winevulkan_fsr.patch
    wine-more_8x5_res.patch
    proton-sanitize_makefile.patch
    proton-disable_lock.patch
    proton-user_compat_data.patch
    proton-proton_native_transition.patch
)
noextract=(
    wine-gecko-${_geckover}-{x86,x86_64}.tar.xz
    wine-mono-${_monover}-x86.tar.xz
)

_make_wrappers () {
    local _i686=(i686 "-m32" "-melf_i386")
    local _x86_64=(x86_64 "" "")
    local _opts=(_i686 _x86_64)
    declare -n _opt
    for _opt in "${_opts[@]}"; do
        for l in ar as ranlib nm; do
            ln -s /usr/bin/$l wrappers/${_opt[0]}-pc-linux-gnu-$l
        done
        for t in gcc g++; do
            install -Dm755 /dev/stdin wrappers/${_opt[0]}-pc-linux-gnu-$t <<EOF
#!/usr/bin/bash
$(which ccache 2> /dev/null) /usr/bin/$t ${_opt[1]} "\$@"
EOF
        done
        install -Dm755 /dev/stdin wrappers/${_opt[0]}-pc-linux-gnu-ld <<EOF
#!/usr/bin/bash
/usr/bin/ld ${_opt[2]} "\$@"
EOF
    done
}

prepare() {
    # I know this is fugly and it should NOT be done
    # but the afdko package from AUR breaks regularly.
    # Install it from pip in a virtualenv
    [ -d build_venv ] && rm -rf build_venv
    virtualenv --app-data "$srcdir"/build_venv/cache --no-wheel build_venv
    source build_venv/bin/activate
    pip install --no-cache-dir meson==0.59.3
    pip install --no-cache-dir afdko
    pip install --no-cache-dir pefile

    # Provide wrappers to compiler tools
    rm -rf wrappers && mkdir wrappers
    _make_wrappers

    [ ! -d gecko ] && mkdir gecko
    mv wine-gecko-${_geckover}-x86{,_64}.tar.xz gecko/

    [ ! -d mono ] && mkdir mono
    mv wine-mono-${_monover}-x86.tar.xz mono/

    [ ! -d build ] && mkdir build
    cd proton

    _submodules=(
        wine-valve::wine
        dxvk-valve::dxvk
        openvr
        liberation-fonts::fonts/liberation-fonts
        FAudio
        gstreamer
        gst-plugins-base
        gst-plugins-good
        gst-orc
        vkd3d-proton
        OpenXR-SDK
        dxvk-nvapi
        SPIRV-Headers
        Vulkan-Headers
        vkd3d-zfigura::vkd3d
    )

    for submodule in "${_submodules[@]}"; do
        git submodule init "${submodule#*::}"
        git config submodule."${submodule#*::}".url "$srcdir"/"${submodule%::*}"
        git submodule update "${submodule#*::}"
    done

    pushd vkd3d-proton
        for submodule in subprojects/{dxil-spirv,Vulkan-Headers,SPIRV-Headers}; do
            git submodule init "${submodule}"
            git config submodule."${submodule}".url "$srcdir"/"${submodule#*/}"
            git submodule update "${submodule}"
        done
        pushd subprojects/dxil-spirv
            git submodule init third_party/spirv-headers
            git config submodule.third_party/spirv-headers.url "$srcdir"/SPIRV-Headers
            git submodule update third_party/spirv-headers
        popd
    popd

    pushd dxvk-nvapi
        git submodule init external/Vulkan-Headers
        git config submodule.external/Vulkan-Headers.url "$srcdir"/Vulkan-Headers
        git submodule update external/Vulkan-Headers
    popd

    pushd media-converter
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_HOME="${srcdir}"/build/.cargo
        cargo update
        cargo fetch --locked --target "i686-unknown-linux-gnu"
        cargo fetch --locked --target "x86_64-unknown-linux-gnu"
    popd

    pushd wine
        # From Arch Wine
        sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*
        # Fix openldap 2.5+ detection
        sed 's/-lldap_r/-lldap/' -i configure
        # Add FSR for fshack
        patch -p1 -i "$srcdir"/wine-winevulkan_fsr.patch
        # Adds more 16:10 resolutions for use with FSR
        patch -p1 -i "$srcdir"/wine-more_8x5_res.patch
    popd

    pushd dxvk
        # Uncomment to enable dxvk async patch.
        # Enable at your own risk. If you don't know what it is,
        # and its implications, leave it as is. You have been warned.
        # I am not liable if anything happens to you by using it.
        patch -p1 -i "$srcdir"/dxvk-async-${_asyncver}.patch
    popd

    patch -p1 -i "$srcdir"/proton-sanitize_makefile.patch
    patch -p1 -i "$srcdir"/proton-disable_lock.patch
    patch -p1 -i "$srcdir"/proton-user_compat_data.patch

    # Remove repos from srcdir to save space
    for submodule in "${_submodules[@]}"; do
        rm -rf "$srcdir"/"${submodule%::*}"
    done
    rm -rf "$srcdir"/dxil-spirv
    rm -rf "$srcdir"/Vulkan-Headers
    rm -rf "$srcdir"/SPIRV-Headers
}

build() {
    source build_venv/bin/activate
    export PATH="$(pwd)/wrappers:$PATH"

    cd build
    ROOTLESS_CONTAINER="" \
    ../proton/configure.sh \
        --container-engine="" \
        --proton-sdk-image="" \
        --steam-runtime=native \
        --no-proton-sdk \
        --build-name="${pkgname}"

    # Filter known bad flags before applying optimizations
    # Filter fstack-protector{ ,-all,-strong} flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    export CFLAGS="${CFLAGS// -fstack-protector*([\-all|\-strong])/}"
    export CXXFLAGS="${CXXFLAGS// -fstack-protector*([\-all|\-strong])/}"
    # From wine-staging PKGBUILD
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.
    # Doesn't compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/ -fno-plt/}"
    export CXXFLAGS="${CXXFLAGS/ -fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    # MingW Wine builds fail with relro
    export LDFLAGS="${LDFLAGS/,-z,relro/}"

    # By default export FLAGS used by proton and ignore makepkg
    # This overrides FLAGS from makepkg.conf, if you comment these you are on your own
    # If you want the "best" possible optimizations for your system you can use
    # `-march=native` and remove the `-mtune=core-avx2` option.
    # `-O2` is adjusted to `-O3` since AVX is disabled
    export CFLAGS="-O2 -march=nocona -mtune=core-avx2 -pipe"
    export CXXFLAGS="-O2 -march=nocona -mtune=core-avx2 -pipe"
    export LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling AVX (and AVX2 as a side-effect).
    # Since Wine 5.16 AVX is supported. Testing showed 32bit applications
    # crashing with AVX regardless, but 64bit applications worked just fine.
    # So disable AVX only for the 32bit binaries and AVX2 for the 64bit.
    # AVX2 seems to degrade performance. So disregard the above.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    #export CFLAGS+=" -mno-avx -mno-avx2"
    #export CXXFLAGS+=" -mno-avx -mno-avx2"

    export RUSTUP_TOOLCHAIN=stable
    export WINEESYNC=0
    export WINEFSYNC=0
    export DISPLAY=
    SUBJOBS=$([[ "$MAKEFLAGS" =~ -j\ *([1-9][0-9]*) ]] && echo "${BASH_REMATCH[1]}" || echo "$(nproc)") \
        make -j1 dist
}

package() {
    cd build

    local _compatdir="$pkgdir/usr/share/steam/compatibilitytools.d"
    mkdir -p "$_compatdir"
    cp -rf --no-dereference --preserve=mode,links dist "$_compatdir/${pkgname}"

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    mv "$_compatdir/${pkgname}"/LICENSE{,.OFL} \
        "$pkgdir/usr/share/licenses/${pkgname}"

    cd "$_compatdir/${pkgname}/dist"
    i686-w64-mingw32-strip --strip-unneeded \
        $(find lib/wine \( -iname fakedlls \) -prune -false -or -iname "*.dll" -or -iname "*.exe")
    x86_64-w64-mingw32-strip --strip-unneeded \
        $(find lib64/wine \( -iname fakedlls \) -prune -false -or -iname "*.dll" -or -iname "*.exe")

    local _geckodir="share/wine/gecko/wine-gecko-${_geckover}"
    i686-w64-mingw32-strip --strip-unneeded \
        $(find "$_geckodir"-x86 -iname "*.dll" -or -iname "*.exe")
    x86_64-w64-mingw32-strip --strip-unneeded \
        $(find "$_geckodir"-x86_64 -iname "*.dll" -or -iname "*.exe")

    local _monodir="share/wine/mono/wine-mono-${_monover}"
    i686-w64-mingw32-strip --strip-unneeded \
        $(find "$_monodir"/lib/mono -iname "*.dll" -or -iname "*.exe")
    i686-w64-mingw32-strip --strip-unneeded \
        "$_monodir"/lib/x86/*.dll \
        $(find "$_monodir" -iname "*x86.dll" -or -iname "*x86.exe")
    x86_64-w64-mingw32-strip --strip-unneeded \
        "$_monodir"/lib/x86_64/*.dll \
        $(find "$_monodir" -iname "*x86_64.dll" -or -iname "*x86_64.exe")

    cd "$_compatdir/${pkgname}"
    # Add old tool name in compatibilitytool.vdf
    patch -p1 -i "$srcdir"/proton-proton_native_transition.patch
}

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
            '8fab46ea2110b2b0beed414e3ebb4e038a3da04900e7a28492ca3c3ccf9fea94'
            'b4476706a4c3f23461da98bed34f355ff623c5d2bb2da1e2fa0c6a310bc33014'
            'a70c865e590058fa6fc3aa47425646405bdda27f78b9aa6d2030d2d2a8efadbb'
            '9212a9c42ac8c9c7b9ba7378685b27e7ea0e7a8a8aaac1f3f4d37590ada3e991'
            '77214acb6ffc0648408c5e28b434b71d4c6a8c35f7795ac38565e6e0695208b2'
            '9005d8169266ba0b93be30e1475fe9a3697464796f553886c155ec1d77d71215'
            '4abadfbcc01beb7781edadeebc6b5fadea97b0808eebf4648fd812748c730e9c'
            '8be5e0ae9f71d686c72ac094a4eaca14ea288276195d4c0c217a4f3974fbcc70'
            '20f7cd3e70fad6f48d2f1a26a485906a36acf30903bf0eefbf82a7c400e248f3'
            '958f8e69bc789cc8fbe58cb6c9fc62f065692c3c165f20b0c21133ce94bad736')
