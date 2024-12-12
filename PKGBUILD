# Maintainer: Robert Labudda <contact+aur-pter@vonshednob.cc>
pkgname="pter"
pkgver='3.19.0'
pkgrel='1'
pkgdesc="Console UI to manage your todo.txt file(s)"
url="https://codeberg.org/vonshednob/${pkgname}/"
license=('MIT')
arch=('any')
depends=('python'
         'python-pytodotxt'
         'python-cursedspace')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-docutils'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f65c911cd33a63d120b4d3d7cba8d59fa423145b37a75669087975b76d16e9bc')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"

    # install locally
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # remove QT UI launcher
    rm -f "${pkgdir}/usr/bin/qpter"

    # remove template desktop file
    rm -f "${pkgdir}/usr/share/applications/qpter.desktop"
}
