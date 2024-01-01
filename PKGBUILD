# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-brickschema
_name=${pkgname#python-}
pkgver=0.7.2
pkgrel=1
pkgdesc="A library for working with the Brick ontology for buildings (brickschema.org)"
arch=('x86_64')
url="https://brickschema.org/"
license=('BSD')
groups=()
depends=('python-owlrl' 'python-pyshacl')
makedepends=(python-build python-installer python-wheel)
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
md5sums=('7d3cc366039dd74f936c56622e5bbaa1')

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
