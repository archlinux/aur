# Maintainer: ZeroDegress <zerodegress@outlook.com>

_pkgname=aikadm
pkgname=${_pkgname}-git
pkgver=0.0.0.r58.f8a9cd0
pkgrel=1
pkgdesc='Web based greeter for greetd'
url="https://github.com/HumXC/${_pkgname}"
arch=('x86_64')
license=('custom')
depends=('greetd' 'webkit2gtk' 'cage')
optdepends=("${_pkgname}-frontend: default frontend")
makedepends=('wails' 'go' 'npm' 'nodejs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=(
    "${_pkgname}::git+https://github.com/HumXC/${_pkgname}.git"
    "${_pkgname}-frontend::git+https://github.com/HumXC/${_pkgname}-frontend"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "0.0.0.${_revision}"
}

build() {
    cp -r "${srcdir}/${_pkgname}-frontend" "${srcdir}/${_pkgname}/frontend"
    cd "${srcdir}"/${_pkgname}
    go build
}

package() {
    cd "${srcdir}"/"${_pkgname}"
    install -D -m755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}
