# Maintainer: Daniel Nylander <daniel@danielnylander.se>
pkgname=speech-provider-piper
pkgver=0.1.0
pkgrel=1
pkgdesc='Piper speech provider for GNOME Spiel'
arch=('x86_64')
url='https://github.com/yeager/speech-provider-piper'
license=('GPL-3.0-or-later')
depends=('glib2' 'dbus')
makedepends=('rust' 'cargo' 'meson' 'ninja')
optdepends=('piper-tts: neural TTS engine'
            'orca: GNOME screen reader')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yeager/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    meson setup build --prefix=/usr
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
}
