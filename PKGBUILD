# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="holehe"
pkgname="${_pkgname}-git"
pkgver=r424.2b6868f
pkgrel=1
pkgdesc="Efficiently finding registered accounts from emails."
arch=("any")
url="https://github.com/megadose/holehe"
license=("GPL")
_pydeps=("termcolor" "beautifulsoup4" "httpx" "trio" "tqdm" "colorama")
depends=("python" ${_pydeps[@]/#/python-})
makedepends=("git" "python-setuptools")
provides=("holehe")
conflicts=("holehe")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}"
}
