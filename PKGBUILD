# Maintainer: Jack Danger <gzippy@jackdanger.com>
pkgname=gzippy-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="The fastest gzip implementation — drop-in replacement for gzip/gunzip/zcat"
arch=('x86_64' 'aarch64')
url="https://github.com/JackDanger/gzippy"
license=('Zlib')
provides=('gzippy')
conflicts=('gzippy')
optdepends=('gzippy-replace-gzip: replace system gzip/gunzip/zcat with gzippy')

source_x86_64=("gzippy-x86_64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.8.0/gzippy-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("gzippy-aarch64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.8.0/gzippy-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('42cfe9c75e7b510ef7643e74fe5a771433a594f4c9d5ab56b4ad9980e0fb7e40')
sha256sums_aarch64=('177e5ccd3abab14c066b01f74eb6e3de2e6dfba83cd2bbd87d77dbd96c5e5b81')

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
