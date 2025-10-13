# Maintainer: Omansh Krishn <omansh@duck.com>
# Previous Maintainer: westpain <homicide@disroot.org>

pkgname=materialgram-bin
pkgver=6.2.3.1
pkgrel=1
pkgdesc="Telegram Desktop based messenger with Material Design and additional features - Binary Version"
arch=(x86_64)
url="https://github.com/kukuruzka165/materialgram"
license=(GPL3)
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'libxdamage' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'kcoreaddons' 'jemalloc' 'openh264')
makedepends=('chrpath')
optdepends=('webkit2gtk: embedded browser features'
	    'xdg-desktop-portal: desktop integration')
provides=('materialgram')
conflicts=('materialgram-git')
options=(!debug)

source=( https://github.com/kukuruzka165/materialgram/releases/download/v${pkgver}/materialgram-v${pkgver}.tar.gz )

sha256sums=('f06f7ba186414c0f3164304a5e95c2eb5b516522558aada61bab4ce4ad5cce52')

package() {

	cd "${srcdir}/"

	# Creating needed directories
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share"
	install -dm755 "${pkgdir}/usr/share/applications"
	install -dm755 "${pkgdir}/usr/share/dbus-1"
	install -dm755 "${pkgdir}/usr/share/icons"
	install -dm755 "${pkgdir}/usr/share/pixmaps"
	install -dm755 "${pkgdir}/usr/share/metainfo"

	# Application executable
	install -Dm755 "${srcdir}/usr/bin/materialgram" "${pkgdir}/usr/bin/materialgram"

	# Remove RPATH informations
	chrpath --delete "${pkgdir}/usr/bin/materialgram"

	# Desktop launcher
	install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/io.github.kukuruzka165.materialgram.png" "${pkgdir}/usr/share/pixmaps/io.github.kukuruzka165.materialgram.png"
	install -Dm644 "${srcdir}/usr/share/applications/io.github.kukuruzka165.materialgram.desktop" "${pkgdir}/usr/share/applications/io.github.kukuruzka165.materialgram.desktop"

	# DBus service
	install -Dm644 "${srcdir}/usr/share/dbus-1/services/io.github.kukuruzka165.materialgram.service" "${pkgdir}/usr/share/dbus-1/services/io.github.kukuruzka165.materialgram.service"

	# Metainfo
	install -Dm644 "${srcdir}/usr/share/metainfo/io.github.kukuruzka165.materialgram.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.kukuruzka165.materialgram.metainfo.xml"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "${icon_dir}"
		install -m644 "${srcdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/io.github.kukuruzka165.materialgram.png" "${icon_dir}/io.github.kukuruzka165.materialgram.png"
	done
}

