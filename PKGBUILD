# Maintainer: ZeroDegress <zerodegress@outlook.com>

_pkgname=html-greet-frontend
pkgname=${_pkgname}-git
pkgver=0.0.0.r17.107b1b6
pkgrel=1
pkgdesc='Default frontend for html-greet'
url="https://github.com/HumXC/html-greet-frontend"
arch=('any')
license=('custom')
makedepends=('nodejs' 'npm')
conflicts=('html-greet-frontend')
provides=('html-greet-frontend')
source=("${_pkgname}::git+https://github.com/HumXC/html-greet-frontend.git")
sha256sums=('SKIP')
options=('!strip' '!debug')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "0.0.0.${_revision}"
}

build() {
    cd "${srcdir}"/"${_pkgname}"
    npm install
    npm run build
}

package() {
    cd "${srcdir}"/"${_pkgname}"/dist

    install -Dm644 ./index.html "${pkgdir}"/usr/share/html-greet-frontend/index.html
    install -Dm644 ./vite.svg "${pkgdir}"/usr/share/html-greet-frontend/vite.svg

    install -d "${pkgdir}"/usr/share/html-greet-frontend/assets
    local asset
    for asset in ./assets/*; do
        install -Dm644 "${asset}" "${pkgdir}"/usr/share/html-greet-frontend/"${asset}"
    done
}
