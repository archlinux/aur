# Maintainer: Jack Danger <gzippy@jackdanger.com>
pkgname=gzippy-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="The fastest gzip implementation — drop-in replacement for gzip/gunzip/zcat"
arch=('x86_64' 'aarch64')
url="https://github.com/JackDanger/gzippy"
license=('Zlib')
provides=('gzippy')
conflicts=('gzippy')
optdepends=('gzippy-replace-gzip: replace system gzip/gunzip/zcat with gzippy')

source_x86_64=("gzippy-x86_64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.4.0/gzippy-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("gzippy-aarch64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.4.0/gzippy-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3e89411c87674f8f3a601b2588a1293c72342694f055146aeaad685ba6957967')
sha256sums_aarch64=('a675e67d8dd9077ca2cf27d7899e94e19f7d443785dbe771171bb1ba88a80a22')

package() {
    install -Dm755 gzippy "$pkgdir/usr/bin/gzippy"
    ln -sf gzippy "$pkgdir/usr/bin/ungzippy"

    # Man pages (present in releases that include them)
    for page in man/gzippy.1 man/gzippy-format.5 man/gzippy-tuning.7; do
        [ -f "$page" ] || continue
        section="${page##*.}"
        install -Dm644 "$page" "$pkgdir/usr/share/man/man${section}/$(basename "$page")"
    done
}
