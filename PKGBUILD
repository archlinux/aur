# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=podman-bootc
pkgver=0.1.2
pkgrel=1
pkgdesc="Streamlining podman + bootc interactions"
arch=("any")
url="https://github.com/containers/podman-bootc"
license=("Apache-2.0")
depends=(
    'libvirt'
    'qemu-base'
    'podman'
    'swtpm'
    'gvproxy-bin'
)
makedepends=(
    'go'
)
source=("https://github.com/containers/podman-bootc/archive/refs/tags/v0.1.2.tar.gz")
b2sums=('986dacb7ffb06b92a26007b972c2fddcde2df778a153a08c0c07d2e34c00560e165d6df2cdcc2aea2428eb21e8f7562b2f0bf9daed9903edaf60cc226c5420f9')


build(){
    cd "$pkgname-$pkgver" || exit
    go build -tags "$(grep -E '^build_tags = ' Makefile | sed 's/.* = //')" -o "${pkgname}"
}

package() {
    cd "$pkgname-$pkgver" || exit
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
