# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-usfm2osis-git
_pypiname=usfm2osis
pkgver=r121.8fda304
pkgrel=1
_branch=master
pkgdesc='Tools for converting Bibles from USFM to OSIS XML'
arch=('any')
url="https://github.com/chrislit/$_pypiname"
license=(GPL-3.0-only)
makedepends=(git python-setuptools)
depends=(python)
options=(!emptydirs)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "$_pypiname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pypiname"
    mv usfm2osis/scripts/*py usfm2osis/
    sed -i -e 's/usfm2osis.scripts/usfm2osis/g' setup.py
    python setup.py build
}

package() {
    cd "$_pypiname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
