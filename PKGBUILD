# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-todo
pkgver=2.19.0
pkgrel=1
pkgdesc='todo provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-todo')
provides=('elephant-todo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('473f5f7e3fe35d2444696c48e8e8aa8a362a15c66f31c88afdaa8e6409522bd2')

build() {
    cd elephant-${pkgver}/internal/providers/todo
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/todo
    install -Dm 755 todo.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
