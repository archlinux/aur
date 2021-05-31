# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=python-snimpy
_name="${pkgname#python-}"
pkgver=0.8.14
pkgrel=4
pkgdesc='Interactive SNMP tool'
arch=('x86_64')
url='https://github.com/vincentbernat/snimpy'
license=('ISC')
depends=('python-setuptools' 'python-cffi' 'libsmi' 'python-pysnmp')
makedepends=('python-vcversioner')
checkdepends=('python-nose' 'python-mock' 'python-pycryptodomex')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c7bcbb0cf9f6e5bf71cf7b0407fd9149c3ca31d1b681d26305b7e3faeae911c8')

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
