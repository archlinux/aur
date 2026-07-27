# Maintainer: BlueSlime07 <mokhtar.tavakolian.boy@gmail.com>
pkgname=video-archive-converter
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert video archives to H.264 720p while preserving audio, subtitles and attachments."
arch=('any')
url="https://github.com/BlueSlime07/Video_archive_converter"
license=('MIT')
provides=("$pkgname")

depends=(
    'python'
    'ffmpeg'
    'mkvtoolnix-cli'
    'gpac'
)

source=(
    "$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
)

sha256sums=(
    '7682bc69d79d083e03a99f523dbc2c53101161c9fb09763ea718f7bc3808c418'
)

package() {

    cd "$srcdir/$pkgname-$pkgver"

    install -d "$pkgdir/usr/lib/$pkgname"

    install -Dm755 converter.py \
        "$pkgdir/usr/lib/$pkgname/converter.py"

    install -Dm644 classes.py \
        "$pkgdir/usr/lib/$pkgname/classes.py"

    install -Dm644 config.py \
        "$pkgdir/usr/lib/$pkgname/config.py"

    install -Dm644 functions.py \
        "$pkgdir/usr/lib/$pkgname/functions.py"

    install -Dm644 statemod.py \
        "$pkgdir/usr/lib/$pkgname/statemod.py"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 /dev/stdin \
    "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec python3 /usr/lib/$pkgname/converter.py "\$@"
EOF

}
