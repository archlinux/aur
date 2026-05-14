# Maintainer: Jack Danger <gzippy@jackdanger.com>
pkgname=gzippy-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="The fastest gzip implementation — drop-in replacement for gzip/gunzip/zcat"
arch=('x86_64' 'aarch64')
url="https://github.com/JackDanger/gzippy"
license=('Zlib')
provides=('gzippy')
conflicts=('gzippy')
optdepends=('gzippy-replace-gzip: replace system gzip/gunzip/zcat with gzippy')

source_x86_64=("gzippy-x86_64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.7.1/gzippy-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("gzippy-aarch64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.7.1/gzippy-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8a3a004d2fbfe17742d313a6e37f4bafa06d967be1280d0e66e4f4fd672c4032')
sha256sums_aarch64=('0cdefd1ddd82d0ac741aaeacb3a0cdbebd3853b874b078749d94e8dbd5c9697e')

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
