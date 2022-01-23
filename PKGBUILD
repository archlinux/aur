# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf
pkgver=2.1
pkgrel=1
pkgdesc="A posix script to find and watch youtube videos from the terminal. (Without API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'mpv' 'yt-dlp')
makedepends=('make')
optdepends=(
    'dmenu: use dmenu for search prompts and results'
    'rofi:  use rofi for search prompts and results'
    'fzf:   use fzf for results'
    'ueberzug: thumbnails image preview'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ytfzf/archive/v${pkgver}.tar.gz")
sha256sums=('b4815f6b5a8e8ac093de9fc32298f48fa1dc1b505a5e7e9557231edb3fdddd1a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd docs
    install -dm0755 "${pkgdir}/usr/share/doc/${pkgname}"

    install -Dm644 man/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 man/${pkgname}.5 "${pkgdir}/usr/share/man/man5/${pkgname}.5.gz"
    install -Dm644 conf.sh "${pkgdir}/usr/share/doc/${pkgname}"
    
}
