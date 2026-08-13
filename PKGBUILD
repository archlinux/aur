# Maintainer: dougbug589 <180086805+dougbug589@users.noreply.github.com>
pkgname=mak-attatch
pkgver=1.2.0
pkgrel=1
pkgdesc="Attach TMDB cover art posters to video files"
arch=('x86_64' 'aarch64')
url="https://github.com/dougbug589/mak-attatch"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-requests' 'python-guessit' 'ffmpeg' 'mkvtoolnix-cli')
optdepends=('python-textual: TUI interface' 'yazi: TUI file browser' 'chafa: TUI image preview')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('406e9b2cee1ee5e8c94bcb4d491eabd2f7d790ae44dd65a5552dd638a0c513bb')

package() {
    cd "$srcdir/mak-attatch-$pkgver"
    install -Ddm755 "$pkgdir/usr/lib/$pkgname"
    cp -r core ui poster_tui poster-tui config.py main.py requirements.txt assets "$pkgdir/usr/lib/$pkgname/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec /usr/bin/python3 /usr/lib/$pkgname/main.py "\$@"
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname-tui" <<EOF
#!/bin/sh
exec /usr/bin/python3 /usr/lib/$pkgname/poster-tui "\$@"
EOF

    install -Dm644 mak-attatch.desktop "$pkgdir/usr/share/applications/mak-attatch.desktop"
    install -Dm644 assets/logo.png "$pkgdir/usr/share/pixmaps/mak-attatch.png"
}
