# Maintainer: Sameer Hoosen <tabhooked@gmail.com>
# Official package maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Based on telegram-desktop-dev by: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: hexchain <i@hexchain.org>

# Thanks to Dan Elkouby <streetwalrus@codewalr.us> for some of the custom patch ideas!
# https://github.com/Streetwalrus/dotfiles/blob/master/scripts/telegram-desktop

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-udf-patched
pkgver=1.8.1
pkgrel=1
pkgdesc='Telegram Desktop client with several personal patches'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'minizip' 'openal' 'qt5-base' 'qt5-imageformats' 'openssl')
makedepends=('cmake' 'git' 'gyp' 'range-v3' 'python' 'libappindicator-gtk3')
optdepends=(
    'libnotify: desktop notifications'
    'ttf-opensans: default Open Sans font family'
)
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#tag=v$pkgver"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
    "variant::git+https://github.com/mapbox/variant"
    "Catch2::git+https://github.com/catchorg/Catch2.git"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "crl::git+https://github.com/telegramdesktop/crl.git"
    "xxHash::git+https://github.com/Cyan4973/xxHash.git"
    "rlottie::git+https://github.com/john-preston/rlottie.git"
    # Files from the official package
    "tg.protocol::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/tg.protocol"
    "CMakeLists.inj::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/CMakeLists.inj"
    "tdesktop.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/tdesktop.patch"
    "no-gtk2.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/no-gtk2.patch"
    "libtgvoip.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/libtgvoip.patch"
    "demibold.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/demibold.patch"
    "Use-system-wide-font.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/Use-system-wide-font.patch"
    "tdesktop_lottie_animation_qtdebug.patch::https://git.archlinux.org/svntogit/community.git/plain/telegram-desktop/repos/community-x86_64/tdesktop_lottie_animation_qtdebug.patch"
    "revert-private-headers.patch::https://github.com/telegramdesktop/tdesktop/commit/b9d3ba621eb8af638af46c6b3cfd7a8330bf0dd5.patch"
    # Custom patches
    "always_delete_for_everyone.patch"
)
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'b87414ceaae19185a8a5749cea1f6d9f3fc3c69b8dd729e3db8790cde00b987c3c827cd30baf0eac579d1884e34aa2f37bb90778c3c0bc9ca211d75a82891b9d'
    '16874fabcb0d04d6bf8db1ee2fd77fbd09eeb6acc28bb5fd915d378f7a5ed7ebf4aae01c390e516695572cf9ef0e2cb59493e21a35643fd63ddf3fec446858a6'
    '3b6a0450f7981c2ce5f90c1ea46d9fb504194609f357b957b5c4a741681d3c531252394df116f8b77780a3a110783c047c9a081f9651e0792e7423573e390392'
    'a8f1708616a598fea3cb94e3b63b02a7b13b55abd129a5dc02ad502529f4ebe7a673b6a350b669290fd26135358d21e2e10bf4a11d88f58f0685b7c4ab515bc5'
    'd60694dc701aa985b0e82a12c9732b945082470441c687b33167a94f94efcf253baf43bb7280ec160ba338485ee5c62de138e4804cae05f27cc5cf4298166d39'
    '6d0bac5aa4c4992b5400a9a9318f7a4e92d5eab961917cf0b05cdd251ab66a77c52ec8fbef246e8019606a7624d7b5420b87f8153e071e9724c7d2f5c94e47c0'
    'ce6be003220267bac5483caf8302b492e1581892bc36d35a61236ebf9f9d766b8bd2159557a1c36256aa85f461797a38bfaae57b12da7a72101b21c0b17ed653'
    'a83b80668b2dc2cc77c857069fdb45b487793fda01ad8a63bab66c6a1c71e5d032050e4ec7efb5b4c3216badc5377c856ef1f4a59c2e02b24ee53b1d83124bf3'
    'e25dc1c54d6001a7a3740c6cee40a12a2313a3fd2e41986268f0ee5d9d8bf2d34812f539efb0eb5d26d3f263b2e4a7849016711532bf215aa9ff38da30175557'
    '31ed454cbfe5811dedfac516e1c55cd6a2ea69fedb5e09035c04ed1b9647270eafdee1501494ecd948b6baa7a38dbf0747ba686dc89f31804589a39470793ac2'
)

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch2"
    git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
    git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"
    git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
    git submodule update

    patch -Np1 -i "$srcdir/tdesktop.patch"
    patch -Np1 -i "$srcdir/no-gtk2.patch"
    patch -R -Np1 -i "$srcdir/demibold.patch"
    patch -Np1 -i "$srcdir/Use-system-wide-font.patch"
    patch -Np1 -i "$srcdir/tdesktop_lottie_animation_qtdebug.patch"
    patch -R -Np1 -i "$srcdir/revert-private-headers.patch"

    # custom patches
    patch -Np1 -i "$srcdir/always_delete_for_everyone.patch"

    # disable static-qt for rlottie
    sed "/RLOTTIE_WITH_STATIC_QT/d" -i "$srcdir/tdesktop/Telegram/gyp/lib_rlottie.gyp"

    cd "$srcdir/tdesktop"
    cd "Telegram/ThirdParty/libtgvoip"
    patch -Np1 -i "$srcdir/libtgvoip.patch"
}

build() {
    cd "$srcdir/tdesktop"
    export LANG=en_US.UTF-8
    export GYP_DEFINES="TDESKTOP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_DESKTOP_FILE_GENERATION"
    export EXTRA_FLAGS="-Winvalid-pch"
    export CPPFLAGS="$CPPFLAGS $EXTRA_FLAGS"
    export CXXFLAGS="$CXXFLAGS $EXTRA_FLAGS"

    # Telegram requires us to set API_ID and API_HASH for some reason but they do not provide a way to receive a pair
    # See https://github.com/telegramdesktop/tdesktop/commit/65b2db216033aa08b7bc846df27843e566f08981 and
    # https://github.com/telegramdesktop/tdesktop/issues/4717
    # The official API_ID seems to be 2040 while the API_HASH is "b18441a1ff607e10a989891a5462e627".
    # We're going to use the defaults for now but might at some point use the official ones from the official binaries as noted above.

    gyp \
        -Dapi_id=17349 \
        -Dapi_hash=344583e45741c457fe1862106095a5eb \
        -Dbuild_defines=${GYP_DEFINES} \
        -Gconfig=Release \
        --depth=Telegram/gyp --generator-output=../.. -Goutput_dir=out Telegram/gyp/Telegram.gyp --format=cmake
    NUM=$((`wc -l < out/Release/CMakeLists.txt` - 2))
    sed -i "$NUM r ../CMakeLists.inj" out/Release/CMakeLists.txt
    cd "$srcdir/tdesktop/out/Release"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -UTDESKTOP_OFFICIAL_TARGET 
    make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/tdesktop/out/Release/Telegram" "$pkgdir/usr/bin/telegram-desktop"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/tdesktop/lib/xdg/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram.png"
    done
}
