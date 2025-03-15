# Maintainer: Hugo Haldi <hugo.haldi (at) gmail (dot) com>

_name=TypeScript-Go
_pkgname=typescript-go
pkgname=${_pkgname}-git
pkgver=428.048ac9666
pkgrel=1
pkgdesc="Staging repo for development of native port of TypeScript"
arch=(any)
url='https://github.com/microsoft/typescript-go'
license=('Apache-2.0')
makedepends=('git' 'npm' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/microsoft/typescript-go.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd $_pkgname
    npm ci
}

build() {
    cd $_pkgname
    npm run build
}

check() {
    cd $_pkgname
    npm test
}

package() {
    install -Dm644 $_pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/lib/node_modules/${_pkgname}"
    cp -r $_pkgname/built/local/* "${pkgdir}/usr/lib/node_modules/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    ln -s ../lib/node_modules/${_pkgname}/tsgo "${pkgdir}/usr/bin/tsgo"
}
