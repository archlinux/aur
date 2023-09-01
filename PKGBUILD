# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=python-snimpy
_name="${pkgname#python-}"
pkgver=1.0.1
pkgrel=2
pkgdesc='Interactive SNMP tool'
arch=('x86_64')
url='https://github.com/vincentbernat/snimpy'
license=('ISC')
depends=('python-setuptools' 'python-cffi' 'libsmi' 'python-pysnmp')
makedepends=('python-vcversioner')
checkdepends=('python-nose' 'python-mock' 'python-pycryptodomex')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('17ffac15ee3399de4724b4330426a7406a2b52c157cfcf3a4757f1c79144c636')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build

    install -Dm644 docs/license.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    nosetests
}
