# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-czml3
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.0.2
pkgrel=1
pkgdesc="Python 3 library to write CZML"
arch=('any')
url="https://github.com/poliastro/czml3"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-versioneer')
checkdepends=('python-pytest'
#             'subversion'
              'python-astropy'
              'python-attrs'
              'python-dateutil'
              'python-w3lib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://github.com/poliastro/czml3/raw/main/tests/simple.czml"
#       "https://github.com/poliastro/czml3/raw/main/tests/smiley.png")
md5sums=('9819ff7c755c72543c7b099fdf8ecb0a')
#        'SKIP'
#        'SKIP')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    rm versioneer.py
#    cp ${srcdir}/{simple.czml,smiley.png} tests
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   svn export https://github.com/poliastro/czml3/trunk/tests || warning "Failed to fetch testing files"
    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-czml3() {
    depends=('python>=3.7' 'python-attrs>=19.2' 'python-dateutil<3' 'python-w3lib')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
