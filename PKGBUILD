# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroslam
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.2019.918.0
pkgrel=1
pkgdesc="Stellar LAbel Machine (SLAM)"
arch=('i686' 'x86_64')
url="https://github.com/hypergravity/astroslam"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-matplotlib' 'python-scikit-learn' 'python-pandas' 'python-emcee' 'python-astropy' 'python-lmfit' 'ipython-ipyparallel')
checkdepends=('python-pyzmq' 'python-jupyter_client')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/hypergravity/astroslam/master/LICENSE")
md5sums=('a47ad2551c7ef518199d28a292f8df51'
         '0c528275ca1d160019f3524f21587e57')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e 's/scipy\.misc/scipy\.interpolate/g' slam/extern/polynomial.py
}

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
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
