# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=reflutter
pkgver=0.8.6
pkgrel=1
pkgdesc="Flutter Reverse Engineering Framework — repacks apps with a patched Flutter library for traffic interception and dynamic analysis"
arch=('any')
url="https://github.com/Impact-I/reFlutter"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('de19aaae644b1aa8c950056892c7b5780b76c0b28c0e2bf790019b7a570f6115')

latestver() {
    curl -fsSL "https://pypi.org/pypi/${pkgname}/json" | python3 -c "import sys,json; print(json.load(sys.stdin)['info']['version'])"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
