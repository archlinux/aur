# Maintainer: bakatrouble <bakatrouble@gmail.com>
# community/telegram-desktop maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-git
pkgver=1.7.14.r1.g8008d8a3d
pkgrel=1
pkgdesc="Official Telegram Desktop client (dev branch)"
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'minizip' 'openal' 'qt5-base' 'qt5-imageformats' 'openssl')
makedepends=('cmake' 'git' 'gyp' 'libappindicator-gtk3' 'python' 'range-v3')
optdepends=('libnotify: desktop notifications'
            'ttf-opensans: default Open Sans font family')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#branch=dev"
        "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
        "variant::git+https://github.com/mapbox/variant"
        "Catch2::git+https://github.com/catchorg/Catch2.git"
        "GSL::git+https://github.com/Microsoft/GSL.git"
        "crl::git+https://github.com/telegramdesktop/crl.git"
        "xxHash::git+https://github.com/Cyan4973/xxHash.git"
        "rlottie::git+https://github.com/john-preston/rlottie.git"
        "tg.protocol::https://git.archlinux.org/svntogit/community.git/plain/trunk/tg.protocol?h=packages/telegram-desktop"
        "CMakeLists.inj::https://git.archlinux.org/svntogit/community.git/plain/trunk/CMakeLists.inj?h=packages/telegram-desktop"
        "tdesktop.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/tdesktop.patch?h=packages/telegram-desktop"
        "no-gtk2.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/no-gtk2.patch?h=packages/telegram-desktop"
        "libtgvoip.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/libtgvoip.patch?h=packages/telegram-desktop"
        "demibold.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/demibold.patch?h=packages/telegram-desktop"
        "Use-system-wide-font.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/Use-system-wide-font.patch?h=packages/telegram-desktop"
        "tdesktop_lottie_animation_qtdebug.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/tdesktop_lottie_animation_qtdebug.patch?h=packages/telegram-desktop"
        "tdesktop-ffmpeg-fix-convertFromARGB32PM.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/tdesktop-ffmpeg-fix-convertFromARGB32PM.patch?h=packages/telegram-desktop"
        "tdesktop-rlottie-static-qt.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/tdesktop-rlottie-static-qt.patch?h=packages/telegram-desktop")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b87414ceaae19185a8a5749cea1f6d9f3fc3c69b8dd729e3db8790cde00b987c3c827cd30baf0eac579d1884e34aa2f37bb90778c3c0bc9ca211d75a82891b9d'
            'b20674f61ff6378749d1f59a6a0da194d33ccc786bd783f6ed62027924a3a8a8d27c9763bf376480432d6536896b0c7eeb8c495c5b8cefff7cf5fe84da50947e'
            '3b6a0450f7981c2ce5f90c1ea46d9fb504194609f357b957b5c4a741681d3c531252394df116f8b77780a3a110783c047c9a081f9651e0792e7423573e390392'
            'a8f1708616a598fea3cb94e3b63b02a7b13b55abd129a5dc02ad502529f4ebe7a673b6a350b669290fd26135358d21e2e10bf4a11d88f58f0685b7c4ab515bc5'
            'd60694dc701aa985b0e82a12c9732b945082470441c687b33167a94f94efcf253baf43bb7280ec160ba338485ee5c62de138e4804cae05f27cc5cf4298166d39'
            '6d0bac5aa4c4992b5400a9a9318f7a4e92d5eab961917cf0b05cdd251ab66a77c52ec8fbef246e8019606a7624d7b5420b87f8153e071e9724c7d2f5c94e47c0'
            'ce6be003220267bac5483caf8302b492e1581892bc36d35a61236ebf9f9d766b8bd2159557a1c36256aa85f461797a38bfaae57b12da7a72101b21c0b17ed653'
            'a83b80668b2dc2cc77c857069fdb45b487793fda01ad8a63bab66c6a1c71e5d032050e4ec7efb5b4c3216badc5377c856ef1f4a59c2e02b24ee53b1d83124bf3'
            '0dec897774142a09835d36e4064132e92e9404081eb4cba33d7e2643de475ff195448b527181fdb444a15764960dfc55eb59964b77a09642310c7b8e8c236e73'
            '1f7cecfc8698ff9e0abce87226e993e73fdf35111d037c2847f7a1f30e65483ab332e45a1bdb86f6ac4c420c1c1429ac20454655d0e982477e37b7c48f0b1599')
pkgver() {
    cd "$srcdir/tdesktop"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
    patch -Np1 -i "$srcdir/tdesktop-ffmpeg-fix-convertFromARGB32PM.patch"
    patch -Np1 -i "$srcdir/tdesktop-rlottie-static-qt.patch"

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
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make -j17
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
