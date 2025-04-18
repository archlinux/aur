# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ipfsspec
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.6.0
pkgrel=1
pkgdesc="readonly implementation of fsspec for IPFS"
arch=('any')
url="https://github.com/fsspec/ipfsspec"
license=('MIT')
makedepends=('python-setuptools-scm>=8'
             'python-build'
             'python-installer')  # wheel required by new setuptools
#            'python-sphinx'
#checkdepends=('python-pytest-asyncio'
##             'python-pytest-xdist'
#              'python-fsspec'
#              'python-aiohttp-retry'
#              'python-dag-cbor'
#              'python-multiformats'
#              'python-pure-protobuf2'
#              )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e2d15216b1e572b0ea41e53d6b115b3b')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    # Require local gateway
#    PYTHONPATH="build/lib" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-ipfsspec() {
    depends=('python>=3.9'
             'python-fsspec>=2024.12.0'
             'python-requests'
             'python-aiohttp'
             'python-aiohttp-retry'
             'python-multiformats'
             'python-dag-cbor>=0.2.2'
             'python-pure-protobuf2>=2.1.0')
#   optdepends=('python-ipfsspec-doc: Documentation for ipfsspec')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-ipfsspec-doc() {
#    pkgdesc="Documentation for Python Parfive"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
