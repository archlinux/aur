# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=python-snimpy
_name="${pkgname#python-}"
pkgver=1.0.0
pkgrel=2
pkgdesc='Interactive SNMP tool'
arch=('x86_64')
url='https://github.com/vincentbernat/snimpy'
license=('ISC')
depends=('python-setuptools' 'python-cffi' 'libsmi' 'python-pysnmp')
makedepends=('python-vcversioner')
checkdepends=('python-nose' 'python-mock' 'python-pycryptodomex')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(65bfe796d3d0234b829a96936bc868c3741743a89179367089bc673ca03c591a)

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
