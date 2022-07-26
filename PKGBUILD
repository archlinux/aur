# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=ctpv
pkgname="${_name}-git"
pkgver=r191.972efd3
pkgrel=1
pkgdesc="Terminal previewer"
arch=('i686' 'x86_64')
url="https://github.com/NikitaIvanovV/ctpv"
license=('MIT')
depends=('file' 'openssl' 'imagemagick' 'coreutils')
makedepends=('git')
optdepends=(
    'perl-image-exiftool: for any files'
    'coreutils: for any, directory, text files'
    'atool: for archive files'
    'colordiff: for diff files'
    'diff-so-fancy: for diff files'
    'git-delta: for diff files'
    'gnupg: for gpg-encrypted files'
    'elinks: for html files'
    'lynx: for html files'
    'w3m: for html files'
    'chafa: for image files'
    'ueberzug: for image files'
    'jq: for json files'
    'mdcat: for markdown files'
    'libreoffice-fresh: for odt files'
    'poppler: for pdf files'
    'bat: for text files'
    'highlight: for text files'
    'source-highlight: for text files'
    'transmission-cli: for torrent files'
    'ffmpegthumbnailer: for video files'
)
source=("git+$url?signed")
sha512sums=('SKIP')
validpgpkeys=('701DE74D84F87EE1BC91CD216E656AC5B97B5133')

pkgver() {
    cd "$srcdir/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    local license_prefix="$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$license_prefix"
    cp "$srcdir/$_name/LICENSE" "$license_prefix"

    cd "$srcdir/${_name}"
	LDFLAGS=-L/usr/lib make PREFIX="/usr" DESTDIR="$pkgdir" install
}
