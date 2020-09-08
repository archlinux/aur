# Maintainer: Henry-Joseph Audéoud <h.audeoud at gmail dot com>

pkgname=python-snimpy
_name="${pkgname#python-}"
pkgver=0.8.14
pkgrel=1
pkgdesc='Interactive SNMP tool'
arch=('x86_64')
url='https://github.com/vincentbernat/snimpy'
license=('ISC')
depends=('python-cffi' 'libsmi' 'python-pysnmp')
makedepends=('python-setuptools' 'python-vcversioner')
checkdepends=('python-vffi' 'python-pysnmp' 'python-nose' 'python-mock')
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
