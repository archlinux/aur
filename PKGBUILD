# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-brickschema
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="A library for working with the Brick ontology for buildings (brickschema.org)"
arch=('x86_64')
url="https://brickschema.org/"
license=('BSD')
groups=()
depends=('python-owlrl' 'python-pyshacl')
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=()
provides=('python-brickschema')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha512sums=('97a058c25d69cd4fb9eb22c2ac4880769b0c1f6b415b1d5b797e45fbd7ad5c0a28fef86724d37650d1f28c07e733351348173a958ce5d2621b438a0bc9bd687a')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}
