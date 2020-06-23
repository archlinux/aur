# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=fontship-git
pkgver=0.1.0.r17.gcdac314
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=('any')
url="https://github.com/theleagueof/${pkgname%-git}"
license=('AGPL3')
depends=('entr'
         'font-v'
         'gftools'
         'git'
         'libarchive'
         'make'
         'python'
         'python-brotli' # fonttools optdepends
         'python-click'
         'python-cffsubr' # ufo2ft optdepends
         'python-fontmake'
         'python-fonttools'
         'python-fs' # fonttools optdepends
         'python-lxml' # fonttools optdepends
         'python-skia-pathops' # ufo2ft optdepends
         'python-ufo2ft'
         'python-ufonormalizer'
         'python-unicodedata2' # fonttools optdepends
         'python-zopfli' # fonttools optdepends
         'sfnt2woff-zopfli'
         'ttfautohint'
         'woff2'
         'zsh')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --abbrev=7 --match 'v*' --tags |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    ./bootstrap.sh
}

build() {
    cd "${pkgname%-git}"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir" install
}
