# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Maintainer: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the initial patches!
# https://github.com/mymedia2/tdesktop

# Updated using:
# https://raw.githubusercontent.com/archlinux/svntogit-community/packages/telegram-desktop/trunk/PKGBUILD
# Thanks to the Arch maintainers :)

# You can pass parameters to `ninja` via MAKEFLAGS

pkgname=telegram-desktop-dev
pkgver=4.8.12
pkgrel=1
pkgdesc='Official Telegram Desktop client - development release'
arch=(x86_64)
url="https://desktop.telegram.org/"
license=('GPL3')
# Although not in order, keeping them in the same order of the standard package
# for my mental sanity.
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'libsigc++-3.0')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop)
conflicts=(telegram-desktop)
# Specify the commit to fetch. Normally the version tag.
_commit="tag=v$pkgver"
# All the sources are Git repositories and might be adjusted when a build issue arise.
# These files might require modifications to be up-to-date.
# In such situation, extra patches will be added.
# An easy way to clone the repo since the last update is:
# git clone --recurse-submodules --shallow-submodules --shallow-since=vOLDVER --branch=vNEWVER https://github.com/telegramdesktop/tdesktop WORKDIR
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop#$_commit"
    "ensure_qt6_build.patch"
    "https://download.gnome.org/sources/glibmm/2.77/glibmm-2.77.0.tar.xz"
    # Here are all the submodule repos.
    # Use the nearby Python script for generating the list
    "submodule_GSL::git+https://github.com/desktop-app/GSL.git"
    "submodule_Implib.so::git+https://github.com/yugr/Implib.so.git"
    "submodule_QR-Code-generator::git+https://github.com/nayuki/QR-Code-generator"
    "submodule_cld3::git+https://github.com/google/cld3.git"
    "submodule_cmake_helpers::git+https://github.com/desktop-app/cmake_helpers.git"
    "submodule_codegen::git+https://github.com/desktop-app/codegen.git"
    "submodule_cppgir::git+https://gitlab.com/mnauw/cppgir.git"
    "submodule_expected::git+https://github.com/TartanLlama/expected"
    "submodule_expected-lite::git+https://github.com/martinmoene/expected-lite.git"
    "submodule_fcitx-qt5::git+https://github.com/fcitx/fcitx-qt5.git"
    "submodule_fcitx5-qt::git+https://github.com/fcitx/fcitx5-qt.git"
    "submodule_hime::git+https://github.com/hime-ime/hime.git"
    "submodule_hunspell::git+https://github.com/hunspell/hunspell"
    "submodule_jemalloc::git+https://github.com/jemalloc/jemalloc"
    "submodule_kcoreaddons::git+https://github.com/KDE/kcoreaddons.git"
    "submodule_kimageformats::git+https://github.com/KDE/kimageformats.git"
    "submodule_lib_base::git+https://github.com/desktop-app/lib_base.git"
    "submodule_lib_crl::git+https://github.com/desktop-app/lib_crl.git"
    "submodule_lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
    "submodule_lib_qr::git+https://github.com/desktop-app/lib_qr.git"
    "submodule_lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
    "submodule_lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
    "submodule_lib_storage::git+https://github.com/desktop-app/lib_storage.git"
    "submodule_lib_tl::git+https://github.com/desktop-app/lib_tl.git"
    "submodule_lib_ui::git+https://github.com/desktop-app/lib_ui.git"
    "submodule_lib_webrtc::git+https://github.com/desktop-app/lib_webrtc.git"
    "submodule_lib_webview::git+https://github.com/desktop-app/lib_webview.git"
    "submodule_libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
    "submodule_lz4::git+https://github.com/lz4/lz4.git"
    "submodule_nimf::git+https://github.com/hamonikr/nimf.git"
    "submodule_plasma-wayland-protocols::git+https://github.com/KDE/plasma-wayland-protocols.git"
    "submodule_range-v3::git+https://github.com/ericniebler/range-v3.git"
    "submodule_rlottie::git+https://github.com/desktop-app/rlottie.git"
    "submodule_swift-corelibs-libdispatch::git+https://github.com/apple/swift-corelibs-libdispatch"
    "submodule_tgcalls::git+https://github.com/TelegramMessenger/tgcalls.git"
    "submodule_tl-cmake::git+https://github.com/TartanLlama/tl-cmake.git"
    "submodule_wayland::git+https://github.com/gitlab-freedesktop-mirrors/wayland.git"
    "submodule_wayland-protocols::git+https://github.com/gitlab-freedesktop-mirrors/wayland-protocols.git"
    "submodule_xxHash::git+https://github.com/Cyan4973/xxHash.git"
)
sha512sums=('SKIP'
            '44b4a265cece9a197441cab7483ffdb300c9b93e46983251eed1254b1ab7aa6488e48c3e2aa02dad7f305623314c8def56ca106bc893c777af37bbe8c43f2bc7'
            '6650e822de2529582d93291025500afb6a182a0c5a564f656f164d79d8765bb4ca9c9d16227148431cc71c2677923b9364e81bbd4ca4f07f68e36bb380fb9574'
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
            'SKIP')

prepare() {
    # Magic submodule configuration, thanks to the Python script
    git -C "$srcdir/tdesktop" submodule init
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/GSL.url "$srcdir/submodule_GSL"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/QR.url "$srcdir/submodule_QR-Code-generator"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/cld3.url "$srcdir/submodule_cld3"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/dispatch.url "$srcdir/submodule_swift-corelibs-libdispatch"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/expected.url "$srcdir/submodule_expected"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/fcitx-qt5.url "$srcdir/submodule_fcitx-qt5"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/fcitx5-qt.url "$srcdir/submodule_fcitx5-qt"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/hime.url "$srcdir/submodule_hime"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/hunspell.url "$srcdir/submodule_hunspell"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/jemalloc.url "$srcdir/submodule_jemalloc"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/kcoreaddons.url "$srcdir/submodule_kcoreaddons"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/kimageformats.url "$srcdir/submodule_kimageformats"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/libtgvoip.url "$srcdir/submodule_libtgvoip"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/lz4.url "$srcdir/submodule_lz4"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/nimf.url "$srcdir/submodule_nimf"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/plasma-wayland-protocols.url "$srcdir/submodule_plasma-wayland-protocols"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/range-v3.url "$srcdir/submodule_range-v3"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/rlottie.url "$srcdir/submodule_rlottie"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/tgcalls.url "$srcdir/submodule_tgcalls"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/wayland.url "$srcdir/submodule_wayland"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/wayland-protocols.url "$srcdir/submodule_wayland-protocols"
    git -C "$srcdir/tdesktop" config src.Telegram/ThirdParty/xxHash.url "$srcdir/submodule_xxHash"
    git -C "$srcdir/tdesktop" config src.Telegram/codegen.url "$srcdir/submodule_codegen"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_base.url "$srcdir/submodule_lib_base"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_crl.url "$srcdir/submodule_lib_crl"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_lottie.url "$srcdir/submodule_lib_lottie"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_qr.url "$srcdir/submodule_lib_qr"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_rpl.url "$srcdir/submodule_lib_rpl"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_spellcheck.url "$srcdir/submodule_lib_spellcheck"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_storage.url "$srcdir/submodule_lib_storage"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_tl.url "$srcdir/submodule_lib_tl"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_ui.url "$srcdir/submodule_lib_ui"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_webrtc.url "$srcdir/submodule_lib_webrtc"
    git -C "$srcdir/tdesktop" config src.Telegram/lib_webview.url "$srcdir/submodule_lib_webview"
    git -C "$srcdir/tdesktop" config src.cmake.url "$srcdir/submodule_cmake_helpers"
    git -C "$srcdir/tdesktop" submodule update

    git -C "$srcdir/tdesktop/cmake" submodule init
    git -C "$srcdir/tdesktop/cmake" config src.external/Implib.so.url "$srcdir/submodule_Implib.so"
    git -C "$srcdir/tdesktop/cmake" config src.external/glib/cppgir.url "$srcdir/submodule_cppgir"
    git -C "$srcdir/tdesktop/cmake" submodule update

    git -C "$srcdir/tdesktop/cmake/external/glib/cppgir" submodule init
    git -C "$srcdir/tdesktop/cmake/external/glib/cppgir" config src.expected-lite.url "$srcdir/submodule_expected-lite"
    git -C "$srcdir/tdesktop/cmake/external/glib/cppgir" submodule update

    git -C "$srcdir/tdesktop/Telegram/ThirdParty/range-v3" submodule init
    git -C "$srcdir/tdesktop/Telegram/ThirdParty/range-v3" config src.doc/gh-pages.url "$srcdir/submodule_range-v3"
    git -C "$srcdir/tdesktop/Telegram/ThirdParty/range-v3" submodule update

    git -C "$srcdir/tdesktop/Telegram/ThirdParty/libtgvoip" submodule init
    git -C "$srcdir/tdesktop/Telegram/ThirdParty/libtgvoip" config src.cmake.url "$srcdir/submodule_cmake_helpers"
    git -C "$srcdir/tdesktop/Telegram/ThirdParty/libtgvoip" submodule update

    git -C "$srcdir/tdesktop/Telegram/ThirdParty/expected" submodule init
    git -C "$srcdir/tdesktop/Telegram/ThirdParty/expected" config src.cmake/tl-cmake.url "$srcdir/submodule_tl-cmake"
    git -C "$srcdir/tdesktop/Telegram/ThirdParty/expected" submodule update

    # Normal preparation here
    cd "$srcdir/tdesktop"

    # Magic is over!
    # We need the extra flag for this vulnerability:
    # https://github.blog/2022-10-18-git-security-vulnerabilities-announced/#cve-2022-39253
    # With the -c flag we enable the file cloning only for this command, as per guidelines:
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
    #git -c protocol.file.allow=always submodule update --recursive

    # Cheating! Linking fixed patches to their usual place
    #for fixed in $srcdir/*_fixed*
    #do
    #    ln -s $fixed ${fixed/_fixed/}
    #done
    # Patch here, if needed!
    # patch -Np1 -i "$srcdir/my_beautiful.patch"

    # Official package patches
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    # Telegram currently needs unstable glibmm so we bundle it in as static libs.
    # This isn't great but what can you do.
    meson setup -D maintainer-mode=true --default-library static --prefix "$srcdir/glibmm" glibmm-2.77.0 glibmm-build
    meson compile -C glibmm-build
    meson install -C glibmm-build

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    export PKG_CONFIG_PATH="$srcdir"/glibmm/usr/local/lib/pkgconfig
    cmake -B build -S tdesktop -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_PREFIX_PATH="$srcdir/glibmm" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
        # Removed flag as useless:
        # -DCMAKE_VERBOSE_MAKEFILE=ON \
    cmake --build build -- $MAKEFLAGS
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
