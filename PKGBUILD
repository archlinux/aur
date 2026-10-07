# Maintainer: H3mul <phil.d324@gmail.com>
pkgname=python-zoekt-py-git
pkgver=0.2.0.r22.gc333e39
pkgrel=1
pkgdesc="A modern, fully typed Python client and CLI for interacting with Zoekt, a fast, scalable code search engine"
arch=('any')
url="https://github.com/udbhav-44/zoekt-py"
license=('MIT')
depends=('python' 'python-requests' 'python-click' 'python-pydantic' 'python-rich' 'python-aiohttp')
makedepends=('git' 'python-setuptools' 'python-pip')
# smoke-test: zoekt-py --help
provides=('zoekt-py')
conflicts=('zoekt-py')
options=('!debug')
source=("git+https://github.com/udbhav-44/zoekt-py")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/zoekt-py"
    printf "%s.r%s.g%s" \
        "$(grep -m1 '^version' pyproject.toml | sed 's/version = "\(.*\)"/\1/')" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/zoekt-py"
    python setup.py build
}

package() {
    cd "${srcdir}/zoekt-py"
    pip install --root="${pkgdir}" --no-deps --ignore-installed --prefix="/usr" .
}
