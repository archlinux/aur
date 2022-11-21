# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

_pyname=xxhash
pkgname="python38-${_pyname}"
pkgver=3.0.0
pkgrel=1
pkgdesc='Python binding for xxHash'
arch=('x86_64')
url="https://github.com/ifduyue/${pkgname}"
depends=('python38' 'xxhash')
makedepends=('git' 'python38-setuptools-scm' 'python38-build' 'python38-installer' 'python38-wheel')
license=('BSD')
source=("${pkgname}::git+https://github.com/ifduyue/${pkgname}.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
    # link to xxHash
    export XXHASH_LINK_SO=1
}

build() {
    cd "${srcdir}/${pkgname}"
    python3.8 -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}"
    python3.8 setup.py test
}

package() {
    cd "${srcdir}/${pkgname}"
    python3.8 -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
