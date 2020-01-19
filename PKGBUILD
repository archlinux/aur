# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop
pkgver=1.1.3
pkgrel=1
pkgdesc="Kotatogram – experimental Telegram Desktop fork"
arch=(x86_64)
url="https://kotatogram.github.io"
license=(GPL3)
depends=(
	qt5-base
	qt5-imageformats
	ffmpeg
	openal
	xz
	lz4
	xxhash
	zlib
	minizip
	openssl
	libtgvoip
	rlottie-tdesktop
	hicolor-icon-theme
	desktop-file-utils
)
makedepends=(
	git
	python
	cmake
	ninja
	range-v3
	enchant
)
optdepends=(
	'enchant: spellchecking support'
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin' 'telegram-desktop' 'telegram-desktop-bin')
source=(
	"${pkgname}::git+https://github.com/kotatogram/${pkgname}.git#tag=k${pkgver}"

	"Catch2::git+https://github.com/catchorg/Catch2.git"
	"crl::git+https://github.com/telegramdesktop/crl.git"
	"GSL::git+https://github.com/Microsoft/GSL.git"
	"libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
	"lz4::git+https://github.com/lz4/lz4.git"
	"rlottie::git+https://github.com/desktop-app/rlottie.git"
	"variant::git+https://github.com/mapbox/variant.git"
	"xxHash::git+https://github.com/Cyan4973/xxHash.git"
	"codegen::git+https://github.com/desktop-app/codegen.git"
	"lib_base::git+https://github.com/desktop-app/lib_base.git"
	"lib_crl::git+https://github.com/desktop-app/lib_crl.git"
	"lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
	"lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
	"lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
	"lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck.git"
	"lib_tl::git+https://github.com/desktop-app/lib_tl.git"
	"lib_ui::git+https://github.com/kotatogram/lib_ui.git"

	"Use-system-font.patch"
	"Use-system-wide-font.patch"
	"system-tray-icon.patch"
	"linux-autostart.patch"
	"Use-system-font-by-default.patch"

	"autostart.desktop"
)
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
            'c7917e7169543a3429b5d7598a3b34b20abf42283557aa6589a1e476d65007a34fa0aa65b4a88f99447eafa16822b0a97943a1f1a92f66949a3e9681c8b225bd'
            '4263c3e3a3edcd91eed2a666b7aa1db61129531d60b5539d7aa24b83f46b17cb5fe65229175e36f76bf2ac76472aa2a1e5fa1c0c5ff0cbb809816cd006bb2ef4'
            '6bdb73dd7ebd8cd50da0f09f2f1fa201e687fee949c4a05f90e62e7e6167ccca877a078021ca611ce8fbb464aab329b92270f07e0cb770c2b7a89a436d37549a'
            'aaef50685b8871f32820e6cca2014aa986500ddcf34f4e99216081310e8622a242420a7d1ce30e277af85eb3f1d1e73c5a67dab9e02b42ef03ae6d76381fe635'
            'a95122676e18b1505b796b79e24521adcf5b29a28a01b7cd3285b5855c8d27e5e0e8f15928f61826e81163dfd3f06e71d27879bef748c1d491a3cd8f9e3212cc'
            '610ce239e1e8ae6cfaaccc507eb2ca174f38e340ceec8f56bec4da1a6e390b516c56be5c82a90674e92d0958ac7c8f2fdba560b044f30fb165b522a58bfb600a')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init

	git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch2"
	git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
	git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
	git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
	git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/lz4"
	git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
	git config submodule.Telegram/ThirdParty/SPMediaKeyTap.url "$srcdir/SPMediaKeyTap"
	git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
	git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"

	git config submodule.Telegram/codegen.url "$srcdir/codegen"
	git config submodule.Telegram/lib_base.url "$srcdir/lib_base"
	git config submodule.Telegram/lib_crl.url "$srcdir/lib_crl"
	git config submodule.Telegram/lib_lottie.url "$srcdir/lib_lottie"
	git config submodule.Telegram/lib_rlottie.url "$srcdir/lib_rlottie"
	git config submodule.Telegram/lib_rpl.url "$srcdir/lib_rpl"
	git config submodule.Telegram/lib_spellcheck.url "$srcdir/lib_spellcheck"
	git config submodule.Telegram/lib_tl.url "$srcdir/lib_tl"
	git config submodule.Telegram/lib_ui.url "$srcdir/lib_ui"

	git submodule update

	patch -Np1 -i "$srcdir/Use-system-font.patch"
	patch -Np1 -i "$srcdir/Use-system-wide-font.patch"
	patch -Np1 -i "$srcdir/system-tray-icon.patch"
	patch -Np1 -i "$srcdir/linux-autostart.patch"
	patch -Np1 -i "$srcdir/Use-system-font-by-default.patch"
}

build() {
	cd "$srcdir/$pkgname"

	# Telegram requires us to set API_ID and API_HASH for some reason but they do not provide a way to receive a pair
	# See https://github.com/telegramdesktop/tdesktop/commit/65b2db216033aa08b7bc846df27843e566f08981 and
	# https://github.com/telegramdesktop/tdesktop/issues/4717
	# The official API_ID seems to be 2040 while the API_HASH is "b18441a1ff607e10a989891a5462e627".
	# We're going to use the defaults for now but might at some point use the official ones from the official binaries as noted above.

	cmake -G Ninja . \
		-DCMAKE_BUILD_TYPE=Release \
		-DTDESKTOP_API_TEST=ON \
		-DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
		-DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
		-DTDESKTOP_DISABLE_DESKTOP_FILE_GENERATION=ON \
		-DTDESKTOP_DISABLE_GTK_INTEGRATION=ON

	cmake --build .
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -m755 "$srcdir/$pkgname/bin/Telegram" "$pkgdir/usr/bin/kotatogram-desktop"

	install -d "$pkgdir/usr/share/KotatogramDesktop/autostart"
	install -m644 "$srcdir/autostart.desktop" "$pkgdir/usr/share/KotatogramDesktop/autostart/kotatogramdesktop.desktop"

	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/$pkgname/lib/xdg/kotatogramdesktop.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"

	install -d "$pkgdir/usr/share/kservices5"
	install -m644 "$srcdir/$pkgname/lib/xdg/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

		install -d "$icon_dir"
		install -m644 "$srcdir/$pkgname/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/kotatogram.png"
	done
}
