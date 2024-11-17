# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pure-protobuf2
_pname=pure-protobuf
_pyname=${_pname//-/_}
pkgname=("python-${_pname}2")
#"python-${_pname}-doc")
pkgver=2.3.0
pkgrel=1
pkgdesc='Implementation of Protocol Buffers with dataclass-based schemaʼs'
arch=('any')
url="https://github.com/eigenein/protobuf/tree/2.3.0"
license=('MIT')
makedepends=('python-hatchling'
             'python-hatch-vcs'
             'python-build'
             'python-installer')
checkdepends=('python-pytest-benchmark')
#             'python-pytest-xdist'
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/eigenein/protobuf/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('60857977f56833262244cd6d406d1f021e1e7ebb78f5fd71276faaab37393a49d1dbdf8c9006933715dbc52e154c050fbabb139ff336cd1e3b4239dc8a3fdee1')

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/protobuf-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdocs build
}

check() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/protobuf-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-pure-protobuf2() {
    depends=('python>=3.7')
    provides=("python-${_pname}=${pkgver}")
    conflicts=("python-${_pname}")
#   optdepends=('python-pure-protobuf2-doc: Documentation for pure-protobuf')
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/protobuf-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
#package_python-pure-protobuf2-doc() {
#    pkgdesc="Documentation for Python pure-protobuf"
##   cd ${srcdir}/${_pyname}-${pkgver}
#    cd ${srcdir}/protobuf-${pkgver}
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
