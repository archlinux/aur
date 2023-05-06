# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>
# contributor: Clint Valentine <valentine.clint@gmail.com>

pkgbase=python-codecov
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.1.13
pkgrel=1
pkgdesc='Report uploader for Codecov'
arch=('any')
url="https://codecov.io"
license=('Apache')
depends=('python-coverage' 'python-requests>=2.7.9' 'python-setuptools')
makedepends=('python-setuptools')
#makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha512sums=('0083395e01a0fa7b49641ec6d88e43208c3e3d251dba8396c89b334620cf0e66447a4e6b3e05e9dd383b93e1efbf55213b77742b3e9de7e22a91296aede727c7')

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
