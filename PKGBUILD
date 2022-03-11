# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>
# contributor: Clint Valentine <valentine.clint@gmail.com>

pkgbase=python-codecov
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.1.12
pkgrel=1
pkgdesc='Report uploader for Codecov'
arch=('any')
url="https://codecov.io"
license=('Apache')
depends=('python-coverage' 'python-requests>=2.7.9')
makedepends=('python-setuptools')
#makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha512sums=('9d364844dc864996e7d65d6210c7bca345a67d5aa61bcdd351591f0aeadcd2662101e59449e8a86b8341d9fc840889cb635b2c41c6287001b598ee1647c86b02')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
    #python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    #python -m installer --destdir="${pkgdir}" dist/*.whl
}
