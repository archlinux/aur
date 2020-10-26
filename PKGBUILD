# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontship
pkgver=0.6.0
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=('any')
url="https://github.com/theleagueof/$pkgname"
license=('AGPL3')
depends=('diffutils'
         'entr'
         'font-v'
         'gftools'
         'git'
         'libarchive'
         'make'
         'python'
         'python-babelfont'
         'python-brotli' # fonttools optdepends
         'python-cffsubr' # ufo2ft optdepends
         'python-fontmake'
         'python-fonttools'
         'python-fs' # fonttools optdepends
         'python-lxml' # fonttools optdepends
         'python-skia-pathops' # ufo2ft optdepends
         'python-ufo2ft'
         'python-ufonormalizer'
         'python-unicodedata2' # fonttools optdepends
         'python-vttlib'
         'python-zopfli' # fonttools optdepends
         'sfdnormalize'
         'sfnt2woff-zopfli'
         'ttfautohint'
         'woff2'
         'zsh')
makedepends=('cargo' 'rust')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('ec5998e0489060a2c9cfe54980513f71ed22526900f5610733be84552936d495')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
