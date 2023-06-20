# Maintainer: Avery Warddhana <them+arch _ nullablevo id au>

pkgname=python-qiling-git
pkgver=1.4.5.r87.g1706049d
pkgrel=1
pkgdesc="An advanced binary emulation framework"
url='https://qiling.io/'
arch=('any')
license=('GPL2')
depends=('python' 'python-capstone' 'python-unicorn' 'python-pefile'
         'python-registry' 'python-keystone' 'python-pyelftools'
         'python-gevent' 'python-multiprocess' 'python-yaml'
         'python-fx' 'python-questionary' 'python-termcolor')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$pkgname::git+https://github.com/qilingframework/qiling.git#branch=dev"
        '0000-fix-qltui.patch')
sha256sums=('SKIP'
            '969600021c25f6ace69c535e9484dcad20a3897762198dd546e5cda18dce2f8a')

pkgver() {
    cd "${pkgname}"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    patch --forward --strip=1 --input="${srcdir}/0000-fix-qltui.patch"
}

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim:set et sw=4 sts=4:
