# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Hiroyuki Komatsu: providing Japan Post zipcode snapshots

## Mozc compile option
_bldtype='Release'
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20251218
_dict=(alt-cannadic
    edict2
    jawiki
    neologd
    personal-names
    place-names
    skk-jisyo
    sudachidict)

pkgbase=mozc-ut-full
pkgname=("$pkgbase-common" "ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.32.5994.102.20251218
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'subversion' 'qt6-base' 'clang' 'fcitx5' 'emacs' 'ibus')
source=(git+https://github.com/fcitx/mozc.git#commit=a02a2846ffaee7e5e71324b522fa0ea0b7723002
    #         2023-07-13: osdn.net is unstable due to Amazon
    "https://github.com/hiroyuki-komatsu/japanpost_zipcode/raw/refs/heads/main/ken_all.zip"
    "https://github.com/hiroyuki-komatsu/japanpost_zipcode/raw/refs/heads/main/jigyosyo.zip"
    #        "https://gitlab.com/BrLi/brli-aur/-/raw/fcitx5-mozc-ut/x-ken-all-${_zipcode_rel}.zip"
    #        "https://gitlab.com/BrLi/brli-aur/-/raw/fcitx5-mozc-ut/jigyosyo-${_zipcode_rel}.zip"
    git+https://github.com/abseil/abseil-cpp.git
    git+https://chromium.googlesource.com/breakpad/breakpad
    git+https://github.com/google/googletest.git
    git+https://chromium.googlesource.com/external/gyp
    git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git
    git+https://github.com/open-source-parsers/jsoncpp.git
    git+https://github.com/google/protobuf.git
    git+https://github.com/utuhiro78/merge-ut-dictionaries.git
    jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2::https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles-multistream-index.txt.bz2)
noextract=(jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2)
for dict in "${_dict[@]}"; do
    source+=("mozcdic-ut-${dict}-${_utdicdate}.txt.bz2"::"https://github.com/utuhiro78/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.bz2")
done
sha512sums=('e1dca88e784a78fd890d42172f38ed26f4745bf0a1dc98d239b97072854a3bc08c145de8350d964acf00235ac698dabb84eed4a4aa5fd801d1fa9d3639343db2'
    '00aef90b785a703d536813616eeec7057eeaf681b83bc35c6c4b597df298ccb6bbd97f97845c7570788e7f063d94b4c62e359ccc698fcaeff17ce472bc1b9225'
    'ec76f0c9b02a8f0a8633d752ebdb80ac7c4d5c71dfd9916cc9140d446bae8e09755db8d40eca87fbb08d21c31db80ec977f307c497f0d731087c73a1df9ea0c7'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '8c1d315b6b5410c40017c3d552e3a87cbf1a294f16603aa6f2f5fe7d3286210be55dee5f86857a1b4825ff97cbc63ce6325ebd12f53f1b309754b7b578e0114a'
    '8a91bc01402aee8dc1bc3d572da20d4e787b714b1d4ef8c9fb7fbe56dbc25c3f956e508a663f67bf685af3ef913ec68b0b991116f44d846afdd130251f4a6ba7'
    '09b86b7527d45423090645a6763bb5d2d2bfe105a1db3736a2b7d48edf73dd2a6a4da4ae8ceb62bf26da210d07a6e6f7260dea7e01539e7746731d898793a07b'
    'd743123b0a2b5d647ba78b2c8d28a19024e03f80cf4702a47cc3226f2de63afa07fd3822a903c7b124157918e4c3572ac9a91e5cd82cecbee5051f09f1b18618'
    '3d29498b27328b7cb5f6e9394ed280316c5d5b775bb07ca58ee661813941eac3fc3d1f6f7782877b59b8bb878b7913c1b5af3c4bd70abf4a0acdeaed38d54a01'
    '2c3317d00faa52980c0069f0655e83681606b6e259044129149bff2ba1b7f17dbfdeeaad832b6d0b2f4935c7fd40bfefec54bbfe04bf189c5868847cc63065f6'
    '7e6c0fac0b1a926ca8edd95f48cc80ee0adb22fda6bddcce330d0d01d56e509f1cb914d3b5b767aadc4ce35ef360229ea10269318387222039690466c31b902a'
    'cc32f65d0ba4fd8c3cdbae3acb5780c723c4e091f08fd12adec3d6a3ad0a2bace0c2e7bd58ff6cb5a4991bbd32fd59dd973f80aa47a303ae94968bc9c82c5949'
    '4841eeee6c073f9d40cb0ca16798918b8a535491b166f3e024228261e7c2d597910c40f5c611205fd17e88034cedbe0298363778007a4c2c254762b40398ec3d')

pkgver() {
    cd "${srcdir}/mozc" || exit
    source <(grep = src/data/version/mozc_version_template.bzl | tr -d ' ')
    printf "%s.%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION + 2))" "$_utdicdate"
}

prepare() {
    mv KEN_ALL.CSV x-ken-all.csv

    cd "$srcdir/mozc" || exit
    git config -f .gitmodules submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
    git config -f .gitmodules submodule.src/third_party/breakpad.url "$srcdir/breakpad"
    git config -f .gitmodules submodule.src/third_party/gtest.url "$srcdir/googletest"
    git config -f .gitmodules submodule.src/third_party/gyp.url "$srcdir/gyp"
    git config -f .gitmodules submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
    git config -f .gitmodules submodule.src/third_party/jsoncpp.url "$srcdir/jsoncpp"
    git config -f .gitmodules submodule.src/third_party/protobuf.url "$srcdir/protobuf"
    git -c protocol.file.allow=always submodule update --init

    cd src || exit
    echo 'Generating zip code seed...'
    PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >>data/dictionary_oss/dictionary09.txt
    echo 'Done.'

    # disable fcitx4 target
    rm unix/fcitx/fcitx.gyp

    # fix mozc icon for kimpanel
    sed -i 's|PREFIX|/usr|' unix/fcitx5/mozc.conf

    # use libstdc++ instead of libc++
    sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

    # UT Dictionary steps, rewrite of `sh make.sh`
    msg 'UT Dictionary steps, rewrite of `sh make.sh`'
    (
        cd "${srcdir}/merge-ut-dictionaries/src/merge" || exit
        # Use our local copy of the Mozc repo
        sed -i -e '124,127d' merge_dictionaries.py
        sed -i -e "65s|os\.path\.exists(f'mozc-{date}.zip')|False|" merge_dictionaries.py
        sed -i -e '71s|zip_ref\.||' merge_dictionaries.py
        sed -i -e "72s|mozc-master/src/data/dictionary_oss/id\.def|${srcdir}/mozc/src/data/dictionary_oss/id\.def|" merge_dictionaries.py
        sed -i -e '74s|id_mozc\.|file\.read()\.|' merge_dictionaries.py
        sed -i -e '80s|zip_ref\.||' merge_dictionaries.py
        sed -i -e "81s|mozc-master/src/data/dictionary_oss/|${srcdir}/mozc/src/data/dictionary_oss/|" merge_dictionaries.py
        sed -i -e '83s|decode()\.||' merge_dictionaries.py
        sed -i -e '53,64d;66,69d;73d' merge_dictionaries.py
    )
    cd "${srcdir}/merge-ut-dictionaries/src/merge" || exit
    msg '1. Append dictionaries'
    for dict in "${_dict[@]}"; do
        cat "$srcdir/mozcdic-ut-${dict}-${_utdicdate}.txt" >>mozcdic-ut.txt
    done
    msg '2. Patch python scripts to avoid downloading'
    mv -v "$srcdir/jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2" jawiki-latest-pages-articles-multistream-index.txt.bz2
    cp -a "$srcdir/mozc" "./mozc-master"
    msg '3. Run the python scripts as in original make.sh, it may take some time...'
    python merge_dictionaries.py mozcdic-ut.txt
    msg '4. Finally add UT dictionary to mozc source'
    cat mozcdic-ut.txt >>"$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
}

build() {
    # Fix compatibility with google-glog 0.3.3 (symbol conflict)
    CFLAGS="${CFLAGS} -fvisibility=hidden"
    CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

    cd mozc/src || exit

    _targets="unix/fcitx5:fcitx5-mozc.so server:mozc_server gui/tool:mozc_tool renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/emacs:mozc_emacs_helper"

    unset ANDROID_NDK_HOME
    unset ANDROID_HOME
    export JAVA_HOME='/usr/lib/jvm/java-21-openjdk/'
    export QT_BASE_PATH=/usr/include/qt

    bazel build --compilation_mode opt --config oss_linux $_targets

}

package_mozc-ut-full-common() {
    pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
    optdepends=('qt6-base: Display GUI of mozc_tool')
    options=('!docs')
    export PREFIX="$pkgdir/usr"
    export _bldtype
    cd mozc/src || exit

    # BSD-3-Clause
    sed -n 1,29p unix/fcitx5/fcitx_key_translator.h >Fcitx5
    sed -i -e 's|^\/\/[ ]\?||g' Fcitx5
    install -Dm644 Fcitx5 "${pkgdir}"/usr/share/licenses/${pkgname}/Fcitx5
    # BSD-3-Clause
    sed -n 67,94p data/installer/credits_en.html >Mozc
    install -Dm644 Mozc "${pkgdir}"/usr/share/licenses/${pkgname}/Mozc
    # BSD-3-Clause
    sed -n 317,344p data/installer/credits_en.html >Breakpad
    install -Dm644 Breakpad "${pkgdir}"/usr/share/licenses/${pkgname}/Breakpad
    # NAIST-2003
    sed -n 355,424p data/installer/credits_en.html >IPAdic
    install -Dm644 IPAdic "${pkgdir}"/usr/share/licenses/${pkgname}/IPAdic
    # BSD-2-Clause
    sed -n 435,457p data/installer/credits_en.html >Japanese-Usage-Dictionary
    install -Dm644 Japanese-Usage-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Japanese-Usage-Dictionary
    # Public Domain Data
    sed -n 468,470p data/installer/credits_en.html >Okinawa-Dictionary
    install -Dm644 Okinawa-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Okinawa-Dictionary
    # BSD-3-Clause
    sed -n 481,513p data/installer/credits_en.html >Protocol-Buffers
    install -Dm644 Protocol-Buffers "${pkgdir}"/usr/share/licenses/${pkgname}/Protocol-Buffers
    # MIT
    sed -n 698,704p data/installer/credits_en.html >Tamachi-Phonetic-Kanji-Alphabet
    install -Dm644 Tamachi-Phonetic-Kanji-Alphabet "${pkgdir}"/usr/share/licenses/${pkgname}/Tamachi-Phonetic-Kanji-Alphabet
    # MIT
    sed -n 762,782p data/installer/credits_en.html >Windows-Implementation-Library
    sed -i -e 's|^[ \t]*||g' Windows-Implementation-Library
    install -Dm644 Windows-Implementation-Library "${pkgdir}"/usr/share/licenses/${pkgname}/Windows-Implementation-Library

    ../scripts/install_server_bazel
}

package_fcitx5-mozc-ut-full() {
    pkgdesc="Fcitx5 module for Mozc with UT dictionary"
    depends=('fcitx5' "$pkgbase-common")
    provides=('fcitx5-mozc')
    replaces=('fcitx5-mozc')
    conflicts=('fcitx-mozc' 'fcitx5-mozc')

    export PREFIX="$pkgdir/usr"
    export _bldtype
    cd mozc/src || exit

    ../scripts/install_fcitx5_bazel
}

package_ibus-mozc-ut-full() {
    pkgdesc="IBus engine module for Mozc with UT dictionary"
    depends=('ibus' "$pkgbase-common")
    conflicts=('ibus-mozc')
    replaces=('ibus-mozc')

    export _bldtype
    cd "${srcdir}/mozc/src" || exit
    install -D -m 755 bazel-bin/unix/ibus/ibus_mozc "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
    install -D -m 644 bazel-bin/unix/ibus/mozc.xml "$pkgdir/usr/share/ibus/component/mozc.xml"
    install -D -m 755 bazel-bin/renderer/qt/mozc_renderer "$pkgdir/usr/lib/mozc/mozc_renderer"

    cd bazel-bin/unix || exit
    unzip -o icons.zip

    install -Dm644 mozc.png "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
    install -Dm644 alpha_full.svg "${pkgdir}/usr/share/ibus-mozc/alpha_full.svg"
    install -Dm644 alpha_half.svg "${pkgdir}/usr/share/ibus-mozc/alpha_half.svg"
    install -Dm644 direct.svg "${pkgdir}/usr/share/ibus-mozc/direct.svg"
    install -Dm644 hiragana.svg "${pkgdir}/usr/share/ibus-mozc/hiragana.svg"
    install -Dm644 katakana_full.svg "${pkgdir}/usr/share/ibus-mozc/katakana_full.svg"
    install -Dm644 katakana_half.svg "${pkgdir}/usr/share/ibus-mozc/katakana_half.svg"
    install -Dm644 outlined/dictionary.svg "${pkgdir}/usr/share/ibus-mozc/dictionary.svg"
    install -Dm644 outlined/properties.svg "${pkgdir}/usr/share/ibus-mozc/properties.svg"
    install -Dm644 outlined/tool.svg "${pkgdir}/usr/share/ibus-mozc/tool.svg"
}

package_emacs-mozc-ut-full() {
    pkgdesc="Emacs engine module for Mozc with UT dictionary"
    depends=('emacs' "$pkgbase-common")
    replaces=('emacs-mozc')
    conflicts=('emacs-mozc')

    export _bldtype
    cd "${srcdir}/mozc/src" || exit
    install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
    install -Dm644 unix/emacs/mozc.el "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
}
