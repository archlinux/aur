# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Eric Fung <loseurmarbles at gmail dot com>
pkgname=python-foolscap
_pkgname=${pkgname#python-}
pkgver=24.9.0
pkgrel=1
pkgdesc='Remote object-messaging for Python+Twisted'
arch=('any')
url='https://github.com/warner/foolscap'
license=('MIT')
depends=('python' 'python-pyopenssl' 'python-six' 'python-twisted' 'python-zope-interface')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${url}/archive/refs/tags/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('80fee12d2e91ba19a4560a71616f29707536fdb800c6629341cbfbabb98dcf69')

build() {
    cd "${_pkgname}-${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${_pkgname}-${pkgver}"
    python -m installer --destdir=${pkgdir} dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
