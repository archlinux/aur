# Maintainer: vantu5z <vantu5z@mail.ru>

pkgname=python-libretranslate-git
pkgver=r31.20221015
pkgrel=1
pkgdesc="Python bindings for LibreTranslate"
url="https://github.com/argosopentech/LibreTranslate-py"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname}::"git+https://github.com/argosopentech/LibreTranslate-py.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    # get number of last git commit
    _commitCount=$(git rev-list --count HEAD)
    # get time of last git commit
    _commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
    # add "r*.*" from package version
    echo "r$_commitCount.$_commitTime"
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
