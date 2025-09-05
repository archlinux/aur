# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-files
pkgver=1.0.0
pkgrel=22
pkgdesc='files provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('fd')
makedepends=('go')
conflicts=('elephant-files')
provides=('elephant-files')
source=("${url}/archive/refs/tags/v${pkgver}-beta-22.tar.gz")
sha256sums=('7d8c8628878d8170211544ed4b5e7880fe8267d5e2e7f509d1e1fe37f45fca01')

build() {
    cd elephant-${pkgver}-beta-22/internal/providers/files
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-22/internal/providers/files
    install -Dm 755 files.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
