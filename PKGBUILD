# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=python-snimpy
_name="${pkgname#python-}"
pkgver=1.0.3
pkgrel=1
pkgdesc='Interactive SNMP tool'
arch=('x86_64')
url='https://github.com/vincentbernat/snimpy'
license=('ISC')
depends=('python-setuptools' 'python-cffi' 'libsmi' 'python-pysnmp')
makedepends=('python-vcversioner')
checkdepends=('python-nose' 'python-mock' 'python-pycryptodomex')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(17fdfccf9070d62948673960b7194aa19fd7620200c5f591b769560040a9d297)

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
