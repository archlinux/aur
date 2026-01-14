# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-unicode
pkgver=2.18.2
pkgrel=2
pkgdesc='unicode provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-unicode')
provides=('elephant-unicode')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4cc90acc93f4cf12ead19360859ad71e52b801c23f27e64182f725913c0529f4')

build() {
    cd elephant-${pkgver}/internal/providers/unicode
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/unicode
    install -Dm 755 unicode.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
