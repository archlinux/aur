# Maintainer: omansh-krishn <omanshkrishn@duck.com>
# Contributor: westpain <homicide@disroot.org>
pkgname=materialgram-bin
pkgver=v5.0.0.1
pkgrel=1
pkgdesc="Telegram Desktop based messenger with Material Design and additional features - Binary Version"
arch=(x86_64)
url="https://github.com/kukuruzka165/materialgram"
license=(GPL3)
depends=('desktop-file-utils' 'glib2' 'ffmpeg' 'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'protobuf' 'rnnoise' 'openssl' 'hicolor-icon-theme' 'libdbus' 'libx11' 'libglvnd' 'fontconfig')
makedepends=('chrpath')
optdepends=('webkit2gtk: embedded browser features'
	    'xdg-desktop-portal: desktop integration')
provides=('materialgram')
conflicts=('materialgram')

source=( https://github.com/kukuruzka165/materialgram/releases/download/${pkgver}/materialgram-${pkgver}.tar.gz )

sha256sums=('1148ad58e0f21025d6bf21d5e37b51731de4236ab5919b0d12d95ba3c0603659')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share"
	install -dm755 "$pkgdir/usr/share/applications"
	install -dm755 "$pkgdir/usr/share/dbus-1"
	install -dm755 "$pkgdir/usr/share/icons"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -dm755 "$pkgdir/usr/share/metainfo"

	# Application executable
	install -Dm755 "$srcdir/usr/bin/materialgram" "$pkgdir/usr/bin/materialgram"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/materialgram"

	# Desktop launcher
	install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/materialgram.png" "$pkgdir/usr/share/pixmaps/materialgram.png"
	install -Dm644 "$srcdir/usr/share/applications/io.github.kukuruzka165.materialgram.desktop" "$pkgdir/usr/share/applications/io.github.kukuruzka165.materialgram.desktop"

	# DBus service
	install -Dm644 "$srcdir/usr/share/dbus-1/services/io.github.kukuruzka165.materialgram.service" "$pkgdir/usr/share/dbus-1/services/io.github.kukuruzka165.materialgram.service"

	# Metainfo
	install -Dm644 "$srcdir/usr/share/metainfo/io.github.kukuruzka165.materialgram.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.kukuruzka165.materialgram.metainfo.xml"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/materialgram.png" "$icon_dir/materialgram.png"
	done
}

