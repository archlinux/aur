# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=ctpv
pkgname="${_name}-git"
pkgver=r264.4efa0f9
pkgrel=1
pkgdesc="Fast image previews for lf"
arch=('i686' 'x86_64')
url="https://github.com/NikitaIvanovV/ctpv"
license=('MIT')
provides=("$_name")
depends=('file' 'openssl')
makedepends=('git')
optdepends=(
    'atool: for archive files'
    'bat: for text files'
    'chafa: for image files on Wayland'
    'colordiff: for diff files'
    'diff-so-fancy: for diff files'
    'elinks: for html files'
    'ffmpeg: for audio files'
    'ffmpegthumbnailer: for audio files'
    'fontforge: for font files'
    'git-delta: for diff files'
    'glow: for markdown files'
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
    'ueberzug: for image files on X11'
    'w3m: for html files'
    'imagemagick'
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

    local doc_prefix="$pkgdir/usr/share/doc/$pkgname"
    mkdir -p "$doc_prefix"
    cp "$srcdir/$_name/README.md" "$doc_prefix"

    cd "$srcdir/${_name}"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
