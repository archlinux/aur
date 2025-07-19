# Maintainer: Seppia <seppia@seppio.fish>
# Contributor: svalo <me@valo.space>

pkgname=dino-git
pkgver=0.5.0.r19.g13c8bac
pkgrel=1
pkgdesc="Simple and modern Jabber/XMPP client written in vala"
arch=('i686' 'x86_64' 'aarch64')
url="https://dino.im/"
license=('GPL3')
depends=('glib2>=2.38' 'glib-networking' 'gtk4' 'gpgme'
	 'libgee>=0.10' 'libgcrypt' 'libsoup3' 'sqlite' 'qrencode'
	 'libomemo-c' 'gspell' 'gst-plugins-base'
	 'gst-plugins-good' 'gst-plugin-gtk4' 'webrtc-audio-processing'
	 'libnice' 'libsrtp' 'libadwaita')
makedepends=('git' 'meson' 'vala>=0.34' 'ninja')
optdepends=('libcanberra: audio notification support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dino::git+https://github.com/dino/dino')
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "${pkgname%-git}" build
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
