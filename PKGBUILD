# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop9
pkgver=1.8.15
pkgrel=1
pkgdesc='Official Telegram Desktop client (personal build)'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'minizip' 'openal' 'qt5-base' 'qt5-imageformats' 'openssl')
makedepends=('cmake' 'git' 'gyp' 'range-v3' 'python' 'libappindicator-gtk3' 'dos2unix')
optdepends=('libnotify: desktop notifications'
            'ttf-opensans: default Open Sans font family')
provides=('telegram-desktop')
conflicts=('telegram-desktop')
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#tag=v$pkgver"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
    "variant::git+https://github.com/mapbox/variant"
    "Catch2::git+https://github.com/catchorg/Catch2.git"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "crl::git+https://github.com/telegramdesktop/crl.git"
    "xxHash::git+https://github.com/Cyan4973/xxHash.git"
    "rlottie::git+https://github.com/john-preston/rlottie.git"
    "tg.protocol"
    "CMakeLists.inj"
    "libtgvoip.patch"

    "tdesktop.patch"
    "no-gtk2.patch"
    "Revert-Disable-DemiBold-fallback-for-Semibold.patch"
    "tdesktop_lottie_animation_qtdebug.patch"
    "Revert-Change-some-private-header-includes.patch"
    "Use-system-wide-font.patch"

    "always_delete_for_everyone.patch"
    "always_clear_history_for_everyone.patch"
    "always_pin_without_notify.patch"
    "always_send_as_photo_or_album.patch"
    "clicky_sticker_panel.patch"
    "dont_pulse_mentions.patch"
    "no_circles.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b87414ceaae19185a8a5749cea1f6d9f3fc3c69b8dd729e3db8790cde00b987c3c827cd30baf0eac579d1884e34aa2f37bb90778c3c0bc9ca211d75a82891b9d'
            'b759e45282c7bd04e1fdcbfd0c009773782bebde36d96363db9869a9d78e7fad41314ad311b7afbfa57db4e66c0265da17e9f81f6d62a972466cb71d19d4b47c'
            'd60694dc701aa985b0e82a12c9732b945082470441c687b33167a94f94efcf253baf43bb7280ec160ba338485ee5c62de138e4804cae05f27cc5cf4298166d39'
            '218f8711eefb5a8115222e099e6d08fc4079584b3aa3594d05a43390f37d5b51fbf1b64511c3a3e7792ef6c32fa6f4c8a65b6188a9efbd340304602552f3a595'
            '117b0c2bae3d3d3aa94d41382621be4e05c3314a2831dba59e1bcfb443e7b8ff4bcd0403544fa0cb6def85b444146bf59eef9da25f96b041d3ce8f5429b4a867'
            'd5cd7ecb5583258462c21a9ae3d4e8ae8c709d47d7ce2c45f8ae23100d24993398b8372021957b9a4607b3988f366e1c0cf64d724d901cb70212665c481217e9'
            '79fcbee94f09df6b443c2b967afe4cba367985af13004b130da27f7bdf20974f76148a8056e98ce92000fabed80a1ff3cb2d332f6f8c70eed8aa909281533cd5'
            '087dd821690dfedf1c275f264a0223b123e31ab9ee95050023930470bc9c866958cae00e2fd9132e6f7efbc4f1dfc3fdc20f8fba1fc9472d92bd702eaa60adb0'
            '2c1bb75449b4634befa3edaac5d20e4b29ede21119549d9a3895dda9d4723f618dd950ee32133e04186fa65d07f80081ba3e3d5585209ba9112aa754d06fbb5c'
            '83af5f5d18bc26d2de5318b97f31956f34ceb0c14efa8cf36c310a543c8c7d3a448c4c448f2fac1e552b40816273bb5139666ff2fa20e2762148ee69ac20d4cb'
            'd32c2e0544b858842317b704e58016e028555a3baad6b22226e826c11dac8a412c808ffe8a7ea0f3f23c00c591e1a6e652c2ba63d8369491e188560f8296d0cb'
            '91a0edab6408a223db77b75df5a913ffd36efa79340e8d78fa01ac2c3b6e09d5a5fc7fa214ccd40473093809f86b7aef199cebf56a1d5821c20083c4a3e5780b'
            '8b4560deaa06ee20eeaa0d6b855f7a8e922804698f9b274875ece8842231bcf688a31f588cb5c726152b3e7b8784c0b5f61eed0eb48e5392dfdfd72117ee8bb1'
            '4f5b61073b4bd28d2cf92cb6bddb91a50518c4ce801d178366b3760ee2cf1692164546e439049c9ba821e23bff2e3080a42bfabf6fa46d613fd56905b405f340'
            '128c139e2e7cd3b12a4a31af1cac1c326b5ed95763499c95a2484efe12cf5f448e3c8e83d73e90169651478e091abfbe505a9001bbb49e8f9fa139cca3aa5012'
            '048c6784fb0bb9182d07916fdfab9f9952cdcb1998b0f780ce74bf03b61ae62774611819db7de5fec5019b9158b42c3912ca28797aeca41a881493e5822afcd8')

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

    dos2unix "$srcdir/tdesktop/.appveyor/install.bat"

    patch -Np1 -i "$srcdir/tdesktop.patch"
    patch -Np1 -i "$srcdir/no-gtk2.patch"
    patch -Np1 -i "$srcdir/Revert-Disable-DemiBold-fallback-for-Semibold.patch"
    patch -Np1 -i "$srcdir/tdesktop_lottie_animation_qtdebug.patch"
    patch -Np1 -i "$srcdir/Revert-Change-some-private-header-includes.patch"
    patch -Np1 -i "$srcdir/Use-system-wide-font.patch"

    patch -Np1 -i "$srcdir/always_delete_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_clear_history_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_pin_without_notify.patch"
    patch -Np1 -i "$srcdir/always_send_as_photo_or_album.patch"
    patch -Np1 -i "$srcdir/clicky_sticker_panel.patch"
    patch -Np1 -i "$srcdir/dont_pulse_mentions.patch"
    patch -Np1 -i "$srcdir/no_circles.patch"

    unix2dos "$srcdir/tdesktop/.appveyor/install.bat"
    # disable static-qt for rlottie
    sed "/RLOTTIE_WITH_STATIC_QT/d" -i "$srcdir/tdesktop/Telegram/gyp/lib_rlottie.gyp"

    cd "$srcdir/tdesktop"
    cd "Telegram/ThirdParty/libtgvoip"
    patch -Np1 -i "$srcdir/libtgvoip.patch"
}

build() {
    cd "$srcdir/tdesktop"
    export LANG=en_US.UTF-8
    export GYP_DEFINES="TDESKTOP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_DESKTOP_FILE_GENERATION,TDESKTOP_FORCE_GTK_FILE_DIALOG"
    export EXTRA_FLAGS="-Winvalid-pch"
    export CPPFLAGS="$CPPFLAGS $EXTRA_FLAGS"
    export CXXFLAGS="$CXXFLAGS $EXTRA_FLAGS"

    # Telegram requires us to set API_ID and API_HASH for some reason but they do not provide a way to receive a pair
    # See https://github.com/telegramdesktop/tdesktop/commit/65b2db216033aa08b7bc846df27843e566f08981 and
    # https://github.com/telegramdesktop/tdesktop/issues/4717
    # The official API_ID seems to be 2040 while the API_HASH is "b18441a1ff607e10a989891a5462e627".

    gyp \
        -Dapi_id=2040 \
        -Dapi_hash=b18441a1ff607e10a989891a5462e627 \
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
