# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>

_name='commons-downloader'
pkgrel=1

pkgdesc='An “officially endorsed” bulk download script to download files from Wikimedia Commons.'
url='https://git.sr.ht/~nytpu/commons-downloader'

arch=('any')
license=('GPL')
depends=('curl' 'wget' 'jq' 'libxml2')
makedepends=('git' 'marked-man')

source=("git+https://git.sr.ht/~nytpu/${_name}")
sha256sums=('SKIP')

pkgname="${_name}-git"
pkgver=2b6880b

pkgver() {
    cd "${srcdir}/${_name}"
    echo "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_name}"
    marked-man README.md > "${_name}.1"
}

package() {
    cd "$srcdir"/${_name}
    install -Dm 755 "${_name}" "${pkgdir}/usr/bin/${_name}"
    install -Dm 644 "${_name}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${_name}/COPYING"
}
