# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-berliner
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.0.10
pkgrel=1
pkgdesc="Tools for stellar tracks & isochrones"
arch=('i686' 'x86_64')
url="https://github.com/hypergravity/berliner"
license=('MIT')
#makedepends=('python-pip')
depends=('python-scipy' 'python-regli' 'python-joblib')
optdepends=('python-astropy: For testing')
#source=("https://files.pythonhosted.org/packages/py3/${_pyname:0:1}/${_pyname}/${_pyname/-/_}-${pkgver}-py3-none-any.whl")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/hypergravity/berliner/master/LICENSE")
md5sums=('fbcd6ab92bac7250737bd234de408f73'
         '4138b8245bda677d8910e00d4338e70b')
#_pyver=$(python -V | cut -c 8-10)

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python setup.py test
#}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   install -D -m644 ${_pyname}-${pkgver}.dist-info/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${srcdir}/LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" README.md
#   PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps *.whl
#   python -O -m compileall "${pkgdir}/usr/lib/python${_pyver}/site-packages/${_pyname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
