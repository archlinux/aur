# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-bookmarks
pkgver=2.14.3
pkgrel=1
pkgdesc='bookmarks provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('sqlite3' 'jq')
makedepends=('go')
conflicts=('elephant-bookmarks')
provides=('elephant-bookmarks')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9201a52063f45d918a6362b08730f439d0e922445b86fb5dc9cc742e9a50046d')

build() {
    cd elephant-${pkgver}/internal/providers/bookmarks
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/bookmarks
    install -Dm 755 bookmarks.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
