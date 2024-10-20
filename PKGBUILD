# Maintainer: Robert Labudda <contact+aur-pytodotxt@vonshednob.cc>
_pbasename='pytodotxt'
pkgname="python-${_pbasename}"
pkgver='2.0.0.post1'
pkgrel='1'
pkgdesc="Python library for todo.txt task list files"
url="https://codeberg.org/vonshednob/${_pbasename}/"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pbasename::1}/${_pbasename}/${_pbasename}-${pkgver}.tar.gz")
sha256sums=('bdbdfc17840b18903d37784d1c58c49fdd8127323d9b6234e3992a74eea80310')

build() {
    cd "${_pbasename}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pbasename}-${pkgver}"

    # install locally
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # ensure documentation is not installed
    rm -rf "${pkgdir}/usr/share/doc/${_pbasename}/html"
}
