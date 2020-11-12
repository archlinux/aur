# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-tinycss
pkgver=0.4
pkgrel=5
pkgdesc="A complete yet simple CSS parser for Python"
url="https://pypi.python.org/pypi/tinycss"
license=('BSD')
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/t/tinycss/tinycss-$pkgver.tar.gz")
sha256sums=('12306fb50e5e9e7eaeef84b802ed877488ba80e35c672867f548c0924a76716e')
b2sums=('9b7691f5d5fcfb5580a9f2a0f1f50caea3dba74853917e5e46ca93cab6f35f2f8c4f5babf01d25661d05ef1b26ccc35914750917fb92b394b0ca6530a19f3514')

prepare() {
    cd "${srcdir}"/tinycss-${pkgver}

    rm tinycss/speedups.c
    # isort is not a sign of failing code
    sed -i '/addopts/d' setup.cfg
}

build() {
    cd "${srcdir}"/tinycss-${pkgver}

    python setup.py build
}

check() {
    cd "${srcdir}"/tinycss-${pkgver}

    pytest build/
    find build/ -type f -name \*-PYTEST.pyc -delete
}

package() {
    cd "${srcdir}"/tinycss-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
