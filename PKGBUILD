# Maintainer: taotieren <admin@taotieren.com>
pkgname=ymake-git
pkgver=0.7.1.2.gd472ca6
pkgrel=1
pkgdesc="ymake"
arch=('any')
url="https://github.com/evilbinary/ymake"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(python)
makedepends=(git python-build python-installer python-wheel python-setuptools)
backup=()
options=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --always --tags | sed 's/^v//' | sed 's|-|.|g'
}

build() {
    cd "${srcdir}/${pkgname}"
    # pip install -r requirements.txt
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}



