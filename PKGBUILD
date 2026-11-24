# Maintainer: profevine <lordehenry@gmail.com>
pkgname=legendary-lyrics
pkgver=1.4.0
pkgrel=1
pkgdesc="Terminal music visualizer for MPRIS players: album art, karaoke lyrics, audio bars"
arch=('any')
url="https://github.com/profevine/legendary-lyrics"
license=('MIT')
depends=(
    'python'
    'python-textual'
    'python-httpx'
    'python-pillow'
    'playerctl'
    'fontconfig'
)
optdepends=(
    'cava: real audio bar visualization'
    'ttf-font: large anti-aliased type for the title and karaoke lyrics'
    'pipewire: mic monitor to hear yourself sing (pw-loopback)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0bcc4cf549cdf121490b9a3555d4a967a01a48cc46d532be0058742acc0aa46d')

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 legendary_lyrics.py \
        "$pkgdir/usr/lib/$pkgname/legendary_lyrics.py"

    install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec /usr/bin/python3 /usr/lib/legendary-lyrics/legendary_lyrics.py "$@"
EOF

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
