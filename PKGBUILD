# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="python-isr"
pkgname="${_pkgname}-git"
pkgver=r.
pkgrel=1
pkgdesc="Super-scale your images and run experiments with Residual Dense and Adversarial Networks."
arch=("any")
url="https://github.com/idealo/image-super-resolution"
license=("Apache")
_pydeps=("numpy" "imageio" "pyaml" "tensorflow")
depends=("python" ${_pydeps[@]/#/python-})
makedepends=("git" "python-setuptools")
provides=("isr")
conflicts=("isr" "python-isr")
source=("${pkgname}-${pkgver}.zip::https://github.com/idealo/image-super-resolution/archive/refs/heads/master.zip")
sha256sums=('SKIP')
_srcname="image-super-resolution-master"

pkgver() {
    cd "${srcdir}/${_srcname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_srcname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_srcname}"
    python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}"
}
