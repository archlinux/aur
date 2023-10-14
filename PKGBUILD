# Maintainer: Robert Labudda <contact+aur-pytodotxt@vonshednob.cc>
_pbasename='cursedspace'
pkgname="python-${_pbasename}"
pkgver='1.5.2'
pkgrel='1'
pkgdesc="A framework for TUI applications on the basis of curses"
url="https://codeberg.org/vonshednob/${_pbasename}/"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools'
             'python-docutils'
             'python-build'
             'python-installer'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pbasename::1}/${_pbasename}/${_pbasename}-${pkgver}.tar.gz")
sha256sums=('21043f80498db9a79d5ee1bb52229fd28ad8871a360601c8f9120ff9dadc2aec')

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
