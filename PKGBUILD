# Maintainer: Kyotaro Sakamoto <skmtkytr+github@gmail.com>
pkgname=twitch-tts-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Twitch chat TTS reader using VOICEVOX"
arch=('x86_64')
url="https://github.com/skmtkytr/twitch-tts"
license=('MIT')
depends=('webkit2gtk-4.1')
optdepends=('pipewire: audio routing for OBS'
            'pulseaudio: alternative audio backend')
provides=('twitch-tts')
conflicts=('twitch-tts' 'twitch-tts-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/skmtkytr/twitch-tts/releases/download/v${pkgver}/twitch-tts-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f9a7318fe3c5ff3f86feb13161c5d126f28a7c88b8f1f9fd4ae7f867a2be3cc7')

package() {
    cd "$srcdir/twitch-tts"
    install -Dm755 twitch-tts "$pkgdir/usr/bin/twitch-tts"
    install -Dm644 appicon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/twitch-tts.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/twitch-tts.desktop" <<EOF
[Desktop Entry]
Name=Twitch TTS
Comment=Twitch chat TTS reader using VOICEVOX
Exec=/usr/bin/twitch-tts
Icon=twitch-tts
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Network;
Keywords=twitch;tts;voicevox;streaming;
EOF
}
