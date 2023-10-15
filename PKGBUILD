# Maintainer: Robert Labudda <contact+aur-pter@vonshednob.cc>
pkgname="pter"
pkgver='3.9.0'
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
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a0fb507e667d0654314a3818723e7369750cbb6628a5c6ec063cab92498eb36f')

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
    rm "${pkgdir}/usr/bin/qpter"

    # remove template desktop file
    rm "${pkgdir}/usr/share/applications/qpter.desktop"
}
