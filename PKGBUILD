# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-todo
pkgver=2.1.2
pkgrel=1
pkgdesc='todo provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-todo')
provides=('elephant-todo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0524efd57d450d572092a7453f617a9d83bccb118fb1b0e6eee22d041faecae8')

build() {
    cd elephant-${pkgver}/internal/providers/todo
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/todo
    install -Dm 755 todo.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
