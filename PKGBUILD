# Maintainer: Robert Labudda <contact+aur-pytodotxt@vonshednob.cc>
_pbasename='pytodotxt'
pkgname="python-${_pbasename}"
pkgver='3.1.0'
pkgrel='1'
pkgdesc="Python library for todo.txt task list files"
url="https://codeberg.org/pter/${_pbasename}/"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pbasename::1}/${_pbasename}/${_pbasename}-${pkgver}.tar.gz")
sha256sums=('00ed7e6ca22a8d7dc0f8f0c3424765209d20808a76c06963a1c43d917506e5fe')

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
