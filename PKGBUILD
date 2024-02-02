# Mantainer: Alesar1
# Contributor: KspLite <ksplite@outlook.com>
pkgname=64gram-desktop-bin
pkgver=1.1.12
pkgrel=1
epoch=1
pkgdesc="Unofficial desktop version of Telegram messaging app - binary version"
arch=(x86_64)
url="https://github.com/TDesktop-x64/tdesktop"
license=(GPL3)
depends=(desktop-file-utils glib2 hicolor-icon-theme libdbus libx11 libglvnd fontconfig)
optdepends=('ttf-opensans: default Open Sans font family')
conflicts=(64gram-desktop)
provides=(64gram-desktop)

source=(
	"io.github.tdesktop_x64.TDesktop.desktop"
	${url}/raw/dev/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
	"${url}/releases/download/v${pkgver}/64Gram_${pkgver}_linux.zip"
)

sha256sums=('8d93c52e7ad8d83f27e7f0adf6bc229886e797720e559a774c551a7001f077f0'
            'ea1f36152b143cc2664daef5026656d55be2230ed42d43628e17ef7d2fff718c'
            '9e4180c78c895783b4559c5e1a7868a2c9aa30a29969fe5dbe9a4ce4cf5cde6c'
            '041b78681a35f07c3c929662fc66b6592c88588dc7297a5394ef7f923f2118e2'
            '554dff9f55697d4e8ec69e9aa53678aa5dae3e91aa13adc3b115526d8d51dfc9'
            '731431e47a5bc91c697d25c3a54fe7ba004752f5b66e0f282c47588ff7a314e6'
            '3fb1400c7dc9bbc3b5cb3ffedcbf4a9b09c53e28b57a7ff33a8a6b9048864090'
            'e297771c75bd2f81d637a3234f83568be62092f67d16946be23895fa92fa7119'
            '1c3078955b6bb5557b12b2741fcf6bc3af09e67c460d66486d46f9087ee09773')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Telegram" "$pkgdir/usr/bin/64gram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/64gram.png"
	install -Dm644 "$srcdir/io.github.tdesktop_x64.TDesktop.desktop" "$pkgdir/usr/share/applications/io.github.tdesktop_x64.TDesktop.desktop"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/64gram.png"
	done

	# Disable the official Telegram Desktop updater
	mkdir -p "$pkgdir/usr/share/64Gram/externalupdater.d"
	echo "/usr/bin/64gram-desktop" >"$pkgdir/usr/share/64Gram/externalupdater.d/telegram-desktop.conf"
}
