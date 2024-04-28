# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-test-result
_name=${pkgname:7}
pkgver=0.3.8
pkgrel=1
pkgdesc="An extension for colcon-core to provide information about the test results."
arch=(any)
url="https://pypi.org/project/colcon-test-result"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools' 'flake8')
source=(
    https://github.com/colcon/colcon-test-result/archive/refs/tags/${pkgver}.tar.gz
    upstream.path::https://github.com/colcon/colcon-test-result/compare/0.3.8...master.patch
    https://github.com/myint/scspell/archive/refs/tags/v2.2.tar.gz)
sha256sums=('b10643fd8de667e320843558aafbf7dd4f756b6addbbe7e03e08f5de6e375d06'
            '35986bb5ddcf824b113792504c273cceb25bc4c385e80d63fd810349775b531c'
            '04c6a795a9e0ef4571678eb9fc503bcf39106a975691336af778f31a01027082')

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_name}-${pkgver}
    export PYTHONPATH="${srcdir}/scspell-2.2"
    ls test*.py | xargs -I {} pytest {}
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
