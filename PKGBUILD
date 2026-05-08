# Maintainer: profevine <lordehenry@gmail.com>
pkgname=legendary-lyrics
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal music visualizer with album art, synced lyrics and bar animation"
arch=('any')
url="https://github.com/profevine/legendary-lyrics"
license=('MIT')
depends=(
    'python'
    'python-textual'
    'python-httpx'
    'python-pillow'
    'playerctl'
)
optdepends=('cava: real audio bar visualization')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('121e5b2890f73a9769ee50484e2fe162037bffbb64aea7b4f73228ccfdb87e50')

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
