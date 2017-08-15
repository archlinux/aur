# Maintainer: Laurent Soest <laurent.soest(at)gmail.com>

pkgname=('python-portend' 'python2-portend')
pkgver=2.1.2
pkgrel=2
pkgdesc="Use portend to monitor TCP ports for bound or unbound states."
arch=('any')
url="https://github.com/jaraco/portend"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-setuptools-scm' 'python2-setuptools-scm')
checkdepends=('python-tox' 'python2-tox')
source=("https://github.com/jaraco/portend/archive/$pkgver.tar.gz")
md5sums=('cb13025e66b05b891ac7a2b428e35456')

build() {
    cp -r "${srcdir}/portend-${pkgver}" "${srcdir}/portend-${pkgver}-py2"

    # setuptools wont find version from git tag
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    cd "$srcdir/portend-$pkgver"
    python ./setup.py build

    cd "${srcdir}/portend-${pkgver}-py2"
    python2 ./setup.py build
}

package_python-portend() {
    depends=('python' 'python-tempora')
    cd "$srcdir/portend-$pkgver"
    python ./setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-portend() {
    depends=('python2' 'python2-tempora')
    cd "$srcdir/portend-$pkgver-py2"
    python2 ./setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/portend-$pkgver"
    tox

    cd "$srcdir/portend-$pkgver-py2"
    tox2
}
