# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroslam
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.2020.811.0
pkgrel=1
pkgdesc="Stellar LAbel Machine (SLAM)"
arch=('i686' 'x86_64')
url="https://github.com/hypergravity/astroslam"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-matplotlib' 'python-scikit-learn' 'python-pandas' 'python-emcee' 'python-astropy' 'python-lmfit' 'python-ipyparallel' 'python-joblib')
checkdepends=('python-pyzmq' 'python-jupyter_client' 'python-pillow')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/hypergravity/astroslam/master/LICENSE")
md5sums=('e2cf7cf28109dd34e97a259395a3535b'
         'SKIP')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install -D -m644 README.md doc/* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
