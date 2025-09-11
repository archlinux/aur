# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-unicode
pkgver=1.0.1
pkgrel=1
pkgdesc='unicode provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-unicode')
provides=('elephant-unicode')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4825e551f4f471894e34a0b903d1f01f513c7b8ff70d4405066021786b60568c')

build() {
    cd elephant-${pkgver}/internal/providers/unicode
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/unicode
    install -Dm 755 unicode.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
