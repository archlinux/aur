# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="repostat"
pkgname="${_pkgname}-git"
pkgver=r694.fc6e974
pkgrel=1
pkgdesc="Git repository analyser and HTML-report generator with nvd3-driven interactive metrics visualisations."
arch=("any")
url="https://github.com/vifactor/repostat"
license=("GPL3")
_pydeps=("jinja" "pygit2" "pytz" "pandas" "tqdm")
depends=("python" ${_pydeps[@]/#/python-})
makedepends=("git" "python-setuptools")
provides=("repostat")
conflicts=("repostat")
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}"
}
