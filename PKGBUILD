# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=reflutter
pkgver=0.9.8
pkgrel=1
pkgdesc="Flutter Reverse Engineering Framework — repacks apps with a patched Flutter library for traffic interception and dynamic analysis"
arch=('any')
url="https://github.com/Impact-I/reFlutter"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fec99019ce91a95ed9f4c860436e82240c39acd4f8d21a5b67a01f26bf326598')

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
