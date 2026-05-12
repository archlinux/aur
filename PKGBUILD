# Maintainer: Jack Danger <gzippy@jackdanger.com>
pkgname=gzippy-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="The fastest gzip implementation — drop-in replacement for gzip/gunzip/zcat"
arch=('x86_64' 'aarch64')
url="https://github.com/JackDanger/gzippy"
license=('Zlib')
provides=('gzippy')
conflicts=('gzippy')
optdepends=('gzippy-replace-gzip: replace system gzip/gunzip/zcat with gzippy')

source_x86_64=("gzippy-x86_64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.5.0/gzippy-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("gzippy-aarch64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.5.0/gzippy-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('618d2cc1fdf6d0260d1911a9f0543d84bb8e11a1e343f3ce3f2c91490b37aec6')
sha256sums_aarch64=('994d9cf0b9360b82b668c9dd73a61e8c9d6dc7757407a0ad469556def388e87b')

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
