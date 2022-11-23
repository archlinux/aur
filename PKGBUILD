# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=ctpv
pkgname="${_name}-git"
pkgver=r231.0809563
pkgrel=4
pkgdesc="Fast previewer for lf (stpv replacement)"
arch=('i686' 'x86_64')
url="https://github.com/NikitaIvanovV/ctpv"
license=('MIT')
provides=("$_name")
depends=('file' 'openssl' 'imagemagick' 'coreutils')
makedepends=('git')
optdepends=(
    'atool: for archive files'
    'bat: for text files'
    'chafa: for image files'
    'colordiff: for diff files'
    'coreutils: for any, directory, text files'
    'diff-so-fancy: for diff files'
    'elinks: for html files'
    'ffmpegthumbnailer: for video files'
    'fontforge: for font files'
    'git-delta: for diff files'
    'gnupg: for gpg-encrypted files'
    'highlight: for text files'
    'imagemagick: for svg files'
    'jq: for json files'
    'libreoffice-fresh: for office files'
    'lynx: for html files'
    'mdcat: for markdown files'
    'perl-image-exiftool: for any files'
    'poppler: for pdf files'
    'source-highlight: for text files'
    'transmission-cli: for torrent files'
    'ueberzug: for image files'
    'w3m: for html files'
)
source=("git+$url?signed")
sha512sums=('SKIP')
validpgpkeys=('701DE74D84F87EE1BC91CD216E656AC5B97B5133')

pkgver() {
    cd "$srcdir/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_name}"
    make LDFLAGS=-L/usr/lib
}

package() {
    local license_prefix="$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$license_prefix"
    cp "$srcdir/$_name/LICENSE" "$license_prefix"

    cd "$srcdir/${_name}"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
