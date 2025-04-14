# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=axon-applauncher-git
_pkgpyname=axon_applauncher
_realname=axon
pkgver=0
pkgrel=1

pkgdesc="Hyper-customizable app launcher made in Python (development version)"
arch=('any')

url="https://github.com/wojtmic/${_realname}"
license=('GPL3')

depends=('python' 'python-pyqt6' 'python-simpleeval' 'python-json5')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+${url}.git")

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_realname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_realname}"
    python -m build --wheel --sdist --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/${_realname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
