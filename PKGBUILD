# Maintainer: Carl George < arch at cgtx dot us >

_name="cliff"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.15.0"
pkgrel="2"
pkgdesc="Command Line Interface Formulation Framework"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.3" "python2-pbr>=1.3")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f5ba6fe0940547549947d5a24ca3354145a603d3a9ba054f209d20b66dc02be7')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse|pbr/d' requirements.txt
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-cliff() {
    depends=("python-cmd2>=0.6.7"
             "python-prettytable>=0.7"
             "python-pyparsing>=2.0.1"
             "python-six>=1.9.0"
             "python-stevedore>=1.5.0"
             "python-unicodecsv>=0.8.0"
             "python-yaml>=3.1.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-cliff() {
    depends=("python2-cmd2>=0.6.7"
             "python2-prettytable>=0.7"
             "python2-pyparsing>=2.0.1"
             "python2-six>=1.9.0"
             "python2-stevedore>=1.5.0"
             "python2-unicodecsv>=0.8.0"
             "python2-yaml>=3.1.0")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
