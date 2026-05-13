# Maintainer: Jack Danger <gzippy@jackdanger.com>
pkgname=gzippy-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="The fastest gzip implementation — drop-in replacement for gzip/gunzip/zcat"
arch=('x86_64' 'aarch64')
url="https://github.com/JackDanger/gzippy"
license=('Zlib')
provides=('gzippy')
conflicts=('gzippy')
optdepends=('gzippy-replace-gzip: replace system gzip/gunzip/zcat with gzippy')

source_x86_64=("gzippy-x86_64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.7.0/gzippy-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("gzippy-aarch64-unknown-linux-gnu.tar.gz::https://github.com/JackDanger/gzippy/releases/download/v0.7.0/gzippy-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c9167e5b9fcec593bb668e8300e90e32772cb62cd27179d042db4a4f6e2d4929')
sha256sums_aarch64=('aa4f5f25e80be30af703f4e9548e8f2ddea86875d2f30c8a0949ee72056c8920')

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
