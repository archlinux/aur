# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-files
pkgver=1.0.0
pkgrel=24
pkgdesc='files provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('fd')
makedepends=('go')
conflicts=('elephant-files')
provides=('elephant-files')
source=("${url}/archive/refs/tags/v${pkgver}-beta-23.tar.gz")
sha256sums=('1f3e774784efddebc03ce3ae618999f06abebe4926e2015854017e7bdd00cfbe')

build() {
    cd elephant-${pkgver}-beta-23/internal/providers/files
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-23/internal/providers/files
    install -Dm 755 files.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
