pkgname=luna-ai
pkgver=6.1.0
pkgrel=1
pkgdesc="Luna AI v6 — Hacker-style voice AI desktop assistant"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/luna-ai"
license=('MIT')

depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-requests'
    'python-beautifulsoup4'
    'python-psutil'
    'mpv'
)

optdepends=(
    'ffmpeg: audio fallback'
    'python-pygame: audio playback'
    'brightnessctl: brightness control'
    'yt-dlp: YouTube playback'
    'xdotool: X11 control'
    'ydotool: Wayland control'
    'python-speechrecognition: voice input'
    'python-pyaudio: mic support'
)

source=("luna-ai-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/luna-ai/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"/luna-ai-* || cd "$srcdir"/Luna-ai-*

    install -dm755 "$pkgdir/usr/lib/luna-ai"
    cp -r * "$pkgdir/usr/lib/luna-ai"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/luna-ai" << EOF
#!/usr/bin/env bash
exec /usr/bin/python /usr/lib/luna-ai/main.py "\$@"
EOF

    chmod +x "$pkgdir/usr/bin/luna-ai"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/luna-ai/LICENSE"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/luna-ai.desktop" << EOF
[Desktop Entry]
Name=Luna AI
Exec=luna-ai
Type=Application
Categories=Utility;
EOF
}
