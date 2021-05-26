# Maintainer: Avelino <t AT avelino DOT xxx>

pkgname=ritchie-cli
pkgver=2.11.3
pkgrel=1
pkgdesc="Ritchie CLI is an open-source tool that allows to create, store and share any kind of automation, executing them through command lines, to run operations or start workflows"
arch=('any')
url="https://ritchiecli.io/"
license=("Apache License 2.0")
makedepends=("go")
provides=("ZupIT")
source=(
    "https://github.com/ZupIT/ritchie-cli/archive/${pkgver}.tar.gz"
)
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -pv build/
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go mod download
    make build-linux
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dpm755 -D "dist/linux/rit" "${pkgdir}/usr/local/bin/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
