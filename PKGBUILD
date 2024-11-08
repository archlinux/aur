# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-mock-ssh-server
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.9.1
pkgrel=1
pkgdesc="Mock SSH server for testing purposes"
arch=('any')
url="https://github.com/carletes/mock-ssh-server"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
#            'python-sphinx'
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-paramiko'
              'openssh')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('58cd8cc92ee51959462c490e70ea8336')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-mock-ssh-server() {
    depends=('python>=3.5' 'python-paramiko')
#   optdepends=('python-mock-ssh-server-doc: Documentation for SSHFS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-mock-ssh-server-doc() {
#    pkgdesc="Documentation for Python Parfive"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
