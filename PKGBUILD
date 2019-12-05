# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop
pkgver=1.1.1
pkgrel=3
pkgdesc="Experimental Telegram Desktop fork with option to select custom fonts."
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPL3)
depends=(
	qt5-base
	qt5-imageformats
	ffmpeg
	openal
	xz
	lz4
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
	gyp
	cmake
	ninja
	range-v3
)
optdepends=('ttf-opensans: default Open Sans font family')
conflicts=('kotatogram-desktop-bin' 'telegram-desktop' 'telegram-desktop-bin')
source=(
	"$pkgname-$pkgver-$pkgrel::git+$url.git#tag=k$pkgver"

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

	"tdesktop.patch"
	"Use-system-wide-font.patch"
	"Parse-Semibold-Fontnames.patch"
	"QtDBus-Notifications-Implementation.patch"
	"system-tray-icon.patch"
	"linux-autostart.patch"
	"Use-native-notifications-by-default.patch"
	"https://github.com/kotatogram/kotatogram-desktop/commit/a196b0aba723de85ee573594d9ad420412b6391a.patch"

	"CMakeLists.inj"
)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
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
            '5c14fb1fa8f7864f4e9c74dd7f5aa8c6a3dea0029ccf07afbd3bdd8fbf700919d57ca4e5e3faf4950d41458766cf909da6976b6ba49b6268ea8cd9f8e539aad1'
            '2548ce368b63e526635060b376e911bd51cd3d2983a8096583f8a71137e9d3f4523f5ee3b3d658d55d7b5497aadc4bee1a2ef53a52f99c67c02be92e0a7ed638'
            'a239a44a5859d03baad86bbeb46795d829cbcd7e67f0d0d49ef855c0421cf9b6d7c1c6d112a266cfec491e93228025235fefd86716bfd0f1c9da3f060c1604c7'
            '8394097bf41e4767b1b3f7978c4f00efa058714f71e8fcec79eae9c2b47849749f307e793fb31c4b35bed5450ad91599f033fc6f360d41ddf01195fffdca817f'
            '6bdb73dd7ebd8cd50da0f09f2f1fa201e687fee949c4a05f90e62e7e6167ccca877a078021ca611ce8fbb464aab329b92270f07e0cb770c2b7a89a436d37549a'
            '63d143cc7accf0d953061d19f34debb0209298a05bafa7ebd3851e4cf8f3a2c7beabdfbebd96434738604140c2196b883148e54c333537942d4d3c81e82517a9'
            '14064af25fda0fcd31a0dc7626687eaf61c329e9100fb55a8a0a455600a63a761e864056088aa486afdd053eccad0a55f8b332151eeb46c90a2c562a64a0a36e'
            '067145e8823b330adc91533c4da6c2dd7babd66a22acbe06ad10920e3139467364d9e658ed6c86837cf11e252c1d8c5a2ff1af2feddb46998e4d018328555ff7'
            '98236f7f161c8bad1152a77505f9c3eebae06ffc0420ed476e101359a92d01438dd6ce6062e0b110b76f2d6d09f59accf4b1969699b8af5a3650ecb0c31929c5')

prepare() {
	cd "$srcdir/$pkgname-$pkgver-$pkgrel"
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

	for i in $srcdir/*.patch; do
		patch -Np1 -i "$i"
	done
}

build() {
	cd "$srcdir/$pkgname-$pkgver-$pkgrel"
	export GYP_DEFINES="DESKTOP_APP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_DESKTOP_FILE_GENERATION,TDESKTOP_DISABLE_GTK_INTEGRATION"

	# Telegram requires us to set API_ID and API_HASH for some reason but they do not provide a way to receive a pair
	# See https://github.com/telegramdesktop/tdesktop/commit/65b2db216033aa08b7bc846df27843e566f08981 and
	# https://github.com/telegramdesktop/tdesktop/issues/4717
	# The official API_ID seems to be 2040 while the API_HASH is "b18441a1ff607e10a989891a5462e627".
	# We're going to use the defaults for now but might at some point use the official ones from the official binaries as noted above.

	gyp \
		-Dapi_id=17349 \
		-Dapi_hash=344583e45741c457fe1862106095a5eb \
		-Dbuild_defines=${GYP_DEFINES} \
		-Dlottie_use_cache=1 \
		-Gconfig=Release \
		--depth=Telegram/gyp --generator-output=../.. -Goutput_dir=out Telegram/gyp/Telegram.gyp --format=cmake
	NUM=$((`wc -l < out/Release/CMakeLists.txt` - 2))
	sed -i "$NUM r ../CMakeLists.inj" out/Release/CMakeLists.txt
	cd "$srcdir/$pkgname-$pkgver-$pkgrel/out/Release"
	cmake -G Ninja .
	cmake --build .
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -m755 "$srcdir/$pkgname-$pkgver-$pkgrel/out/Release/Telegram" "$pkgdir/usr/bin/kotatogram-desktop"

	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/$pkgname-$pkgver-$pkgrel/lib/xdg/kotatogramdesktop.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"

	install -d "$pkgdir/usr/share/kservices5"
	install -m644 "$srcdir/$pkgname-$pkgver-$pkgrel/lib/xdg/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

		install -d "$icon_dir"
		install -m644 "$srcdir/$pkgname-$pkgver-$pkgrel/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/kotatogram.png"
	done
}
