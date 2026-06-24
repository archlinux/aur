# Maintainer: tygrdev <hi@tygr.dev>
# Contributor: wackery, nord-studio
pkgname=pulsar-music
pkgver=0.0.0
pkgrel=1
pkgdesc="A local-first, cross-platform music player."
arch=('x86_64')
url="https://usepulsar.app"
license=('AGPL-3.0-or-later')
provides=('pulsar-music')
conflicts=('pulsar-music-bin')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'libxkbcommon' 'libx11' 'libxcb'
         'wayland' 'dbus' 'vulkan-icd-loader' 'sqlite' 'openssl' 'libssh2')
makedepends=('rust' 'cargo' 'git' 'pkgconf' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://lab.nordstud.io/nord/pulsar/-/archive/v$pkgver/pulsar-v$pkgver.tar.gz"
        'pulsar.desktop')
sha256sums=('SKIP'
            'SKIP')

build() {
	cd "${srcdir}/pulsar-v${pkgver}"
	cargo build --release --frozen -p pulsar
}

package() {
	cd "${srcdir}/pulsar-v${pkgver}"
	install -Dm755 "target/release/pulsar" "${pkgdir}/usr/bin/pulsar"
	install -Dm644 "assets/appicon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pulsar.png"
	install -Dm644 "${srcdir}/pulsar.desktop" "${pkgdir}/usr/share/applications/pulsar.desktop"
}
