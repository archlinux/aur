# Maintainer: Robert Labudda <contact+aur-pter@vonshednob.cc>
pkgname="pter"
pkgver='3.20.1'
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
sha256sums=('4f1c480d0930d93d3d3f2d986ecca1456a00ded21cf0feaf4041cc506cc336ed')

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
