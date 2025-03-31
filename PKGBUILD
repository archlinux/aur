# Maintainer: ZeroDegress <zerodegress@outlook.com>

_pkgname=aikadm-frontend
pkgname=${_pkgname}-git
pkgver=0.0.0.r31.11bc1d1
pkgrel=1
pkgdesc='Default frontend for html-greet'
url="https://github.com/HumXC/${_pkgname}"
arch=('any')
license=('custom')
makedepends=('nodejs' 'npm')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/HumXC/${_pkgname}.git")
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

    install -Dm644 ./index.html "${pkgdir}"/usr/share/${_pkgname}/index.html
    install -Dm644 ./vite.svg "${pkgdir}"/usr/share/${_pkgname}/vite.svg

    install -d "${pkgdir}"/usr/share/${_pkgname}/assets
    local asset
    for asset in ./assets/*; do
        install -Dm644 "${asset}" "${pkgdir}"/usr/share/${_pkgname}/"${asset}"
    done
}
