# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=python-qiling-git
pkgver=1.2.r3.gc29e9add
pkgrel=2
pkgdesc="An advanced binary emulation framework"
url='https://qiling.io/'
arch=('x86_64')
license=('GPL2')
depends=('python' 'python-capstone' 'python-unicorn' 'python-pefile' 'python-registry' 'python-keystone' 'python-pyelftools')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=($pkgname::git://github.com/qilingframework/qiling.git#branch=dev)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
	export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}" -O1 --skip-build
}
