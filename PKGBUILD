# Maintainer: James Tucker <jftucker@gmail.com>
# Contributor: Chris Sutcliff <chris@sutcliff.me>
# Contributor: TheCyberArcher <TheCyberArcher@protonmail.ch>
pkgname=music-assistant-desktop-bin
pkgver=0.6.7
pkgrel=1
pkgdesc="Music Assistant Desktop Companion App"
arch=('x86_64')
url="https://github.com/music-assistant/desktop-app"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libpulse'
    'libsoup3'
    'openssl'
    'libayatana-appindicator'
    'webkit2gtk-4.1'
)
provides=('music-assistant-desktop')
conflicts=('music-assistant-desktop' 'music-assistant-desktop-git' 'music-assistant-companion-git' 'music-assistant-app-git' 'music-assistant-desktop-app-git')
source=("$pkgname-$pkgver.deb::$url/releases/download/$pkgver/Music.Assistant_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/music-assistant/desktop-app/$pkgver/LICENSE")
sha256sums=('fbc3603d983fade44eb88564477ec33bda8deb7ea0f0bad1fbdae8a964e45b3e'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
# Prebuilt upstream binary: leave it exactly as shipped, and do not try to
# split a -debug package out of it.
options=('!strip' '!debug')

package() {
    cd "$srcdir"

    # Extract the deb package
    bsdtar -xf data.tar.gz -C "$pkgdir"

    # The deb carries no copyright file, so take the license from the tag
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
