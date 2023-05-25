# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-abg
_pyname=abg_python
pkgname=("${pkgbase}")
pkgver=1.1.3
pkgrel=1
pkgdesc="common python utilities"
arch=('any')
url="https://github.com/agurvich/abg_python"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-scipy'
              'python-h5py'
              'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d41fd59f0947880b58dd751b3f302811')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest -vv --color=yes #|| warning "Tests failed"
}

package_python-abg() {
    depends=('python-scipy' 'python-h5py' 'python-pandas' 'python-matplotlib')
    provides=('python-abg-python' 'python-abg_python')
    conflicts=('python-abg-python' 'python-abg_python')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
