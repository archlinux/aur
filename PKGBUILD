# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-brickschema
_name=${pkgname#python-}
pkgver=0.7.9
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
sha512sums=('b85b535f94bf37136fe38634b4b407c6e78ec1b7733ac25a63c60c6723c33dd50bc484da8f7549fa7c746c79f61c24f7129f1926f904196b397040b99c62ce3b')

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
