# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-todo
pkgver=2.22.1
pkgrel=1
pkgdesc='todo provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-todo')
provides=('elephant-todo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d1d0d4c55ae531fa3f06406b96504b5165a0d7b53523d1f8351d9d93e457f44')

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
