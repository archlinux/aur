# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname='lfutils'
pkgname="${_pkgname}-git"
pkgver=r44.4dc78d3
pkgrel=1
pkgdesc='Scripts and utilities for the lf file manager.'
arch=('x86_64')
url='https://github.com/soystemd/lfutils'
license=('GPL')
makedepends=('git')
depends=('lf')
optdepends=(
'rsync: copying files using lfpaste'
'archivemount: mounting and opening archives via lfmount'
'sxiv: sxiv integration using lfsxiv'
'ueberzug: image previews'
'chafa: previewing images outside graphical environments'
'imagemagick: previewing svg files'
'gnome-epub-thumbnailer: previewing epub ebooks'
'ffmpegthumbnailer: previewing video thumbnails'
'poppler: previewing PDF files'
'atool: previewing archive contents'
'bat: previewing plain text and code'
'mediainfo: previewing info about music/media files'
'binutils: previewing object files'
'libcdio: previewing ISO files'
'catdoc: previewing Microsoft document files'
'docx2txt: previewing docx files'
'odt2txt: previewing OpenDocument files'
'transmission-cli: previewing .torrent files'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
