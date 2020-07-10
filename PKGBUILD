# Maintainer: bakatrouble <bakatrouble@gmail.com>
# community/telegram-desktop maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-git
pkgver=2.1.18.r0.gc3f5de30b
pkgrel=1
pkgdesc="Official Telegram Desktop client (dev branch)"
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('enchant' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libappindicator-gtk3' 'microsoft-gsl' 'tl-expected')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3')
optdepends=('ttf-opensans: default Open Sans font family')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#tag=dev"
        "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
        "variant::git+https://github.com/desktop-app/variant"
        "GSL::git+https://github.com/Microsoft/GSL.git"
        "Catch::git+https://github.com/philsquared/Catch"
        "xxHash::git+https://github.com/Cyan4973/xxHash.git"
        "rlottie::git+https://github.com/desktop-app/rlottie.git"
        "lz4::git+https://github.com/lz4/lz4.git"
        "lib_crl::git+https://github.com/desktop-app/lib_crl.git"
        "lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
        "lib_base::git+https://github.com/desktop-app/lib_base.git"
        "codegen::git+https://github.com/desktop-app/codegen.git"
        "lib_ui::git+https://github.com/desktop-app/lib_ui.git"
        "lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
        "lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
        "lib_tl::git+https://github.com/desktop-app/lib_tl.git"
        "lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
        "lib_storage::git+https://github.com/desktop-app/lib_storage.git"
        "cmake_helpers::git+https://github.com/desktop-app/cmake_helpers.git"
        "expected::git+https://github.com/TartanLlama/expected"
        "QR-Code-generator::git+https://github.com/nayuki/QR-Code-generator"
        "lib_qr::git+https://github.com/desktop-app/lib_qr.git"
        "libdbusmenu-qt::git+https://github.com/desktop-app/libdbusmenu-qt.git"
        "hunspell::git+https://github.com/hunspell/hunspell"
        "materialdecoration::git+https://github.com/desktop-app/materialdecoration.git"
        "range-v3::git+https://github.com/ericniebler/range-v3.git"
        "fcitx-qt5::git+https://github.com/fcitx/fcitx-qt5.git"
        "nimf::git+https://github.com/hamonikr/nimf.git"
        "hime::git+https://github.com/hime-ime/hime.git"
        "qt5ct::git+https://github.com/desktop-app/qt5ct.git"
        "lxqt-qtplugin::git+https://github.com/lxqt/lxqt-qtplugin.git"
        "libqtxdg::git+https://github.com/lxqt/libqtxdg.git"
        "fcitx5-qt::git+https://github.com/fcitx/fcitx5-qt.git")
sha512sums=('SKIP'
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
    git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch"
    git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"
    git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
    git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/lz4"
    git config submodule.Telegram/lib_crl.url "$srcdir/lib_crl"
    git config submodule.Telegram/lib_rpl.url "$srcdir/lib_rpl"
    git config submodule.Telegram/lib_base.url "$srcdir/lib_base"
    git config submodule.Telegram/codegen.url "$srcdir/codegen"
    git config submodule.Telegram/lib_ui.url "$srcdir/lib_ui"
    git config submodule.Telegram/lib_rlottie.url "$srcdir/lib_rlottie"
    git config submodule.Telegram/lib_lottie.url "$srcdir/lib_lottie"
    git config submodule.Telegram/lib_tl.url "$srcdir/lib_tl"
    git config submodule.Telegram/lib_spellcheck.url "$srcdir/lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "$srcdir/lib_storage"
    git config submodule.cmake.url "$srcdir/cmake_helpers"
    git config submodule.Telegram/ThirdParty/expected.url "$srcdir/expected"
    git config submodule.Telegram/ThirdParty/QR.url "$srcdir/QR-Code-generator"
    git config submodule.Telegram/lib_qr.url "$srcdir/lib_qr"
    git config submodule.Telegram/ThirdParty/libdbusmenu-qt.url "$srcdir/libdbusmenu-qt"
    git config sumbodule.Telegram/ThirdParty/hunspell.url "$srcdir/hunspell"
    git config sumbodule.Telegram/ThirdParty/materialdecoration.url "$srcdir/materialdecoration"
    git config sumbodule.Telegram/ThirdParty/range-v3.url "$srcdir/range-v3"
    git config sumbodule.Telegram/ThirdParty/fcitx-qt5.url "$srcdir/fcitx-qt5"
    git config sumbodule.Telegram/ThirdParty/nimf.url "$srcdir/nimf"
    git config sumbodule.Telegram/ThirdParty/hime.url "$srcdir/hime"
    git config sumbodule.Telegram/ThirdParty/qt5ct.url "$srcdir/qt5ct"
    git config sumbodule.Telegram/ThirdParty/lxqt-qtplugin.url "$srcdir/lxqt-qtplugin"
    git config sumbodule.Telegram/ThirdParty/libqtxdg.url "$srcdir/libqtxdg"
    git config sumbodule.Telegram/ThirdParty/fcitx5-qt.url "$srcdir/fcitx5-qt"
    git submodule update
}

build() {
    cd "$srcdir/tdesktop"
    export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/tdesktop="
    cmake -B build -G Ninja . \
        -Ddisable_autoupdate=1 \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_TEST=ON \
        -DDESKTOP_APP_USE_GLIBC_WRAPS=OFF \
        -DDESKTOP_APP_USE_PACKAGED=ON \
        -DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
        -DDESKTOP_APP_USE_PACKAGED_VARIANT=OFF \
        -DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_DISABLE_DESKTOP_FILE_GENERATION=ON \
        -DTDESKTOP_USE_PACKAGED_TGVOIP=OFF \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop"
    ninja -C build
    
    cat << 'EOF' > "$srcdir/telegram-desktop.sh"
#!/usr/bin/sh
unset QT_QPA_PLATFORMTHEME
exec /usr/bin/telegram-desktop-bin "$@"
EOF
}

package() {
    cd "$srcdir/tdesktop"
    ninja -C build install

    mv "$pkgdir/usr/bin/telegram-desktop"{,-bin}
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/telegram-desktop.sh" "$pkgdir/usr/bin/telegram-desktop"
}
