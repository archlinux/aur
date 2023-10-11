# Maintainer: Stella <jens300304@gmail.com>
# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname=python-jumpcutter
_name=${pkgname#python-}

pkgdesc="Jumpcut silent parts of your videos automagically"

pkgver=0.1.6
pkgrel=1

arch=(any)

url="https://pypi.org/project/jumpcutter/"
license=("MIT")

depends=(python python-moviepy python-tqdm)
makedepends=(python-build python-installer python-wheel)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=("664185983281e283bdd36ca1a276af3c")

build() {
    # move to the source directory
    cd "${srcdir}/${_name}-${pkgver}"

    # build the package
    python -m build --wheel --no-isolation
}

package() {
    # move to the source directory
    cd "${srcdir}/${_name}-${pkgver}"

    # package the files
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # bundle the license in the package
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
