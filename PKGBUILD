# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cpp-coveralls-git
pkgver=0.4.2.r7.g47f6387
pkgrel=2
pkgdesc='Upload gcov results to coveralls.io'
arch=('x86_64')
url='https://github.com/eddyxu/cpp-coveralls'
license=('Apache')
provides=('cpp-coveralls')
conflicts=('cpp-coveralls')
depends=('python' 'python-requests' 'python-yaml')
makedepends=('python-setuptools' 'git')
source=('git+https://github.com/eddyxu/cpp-coveralls.git')
sha256sums=('SKIP')

pkgver()        {
        cd "${srcdir}/cpp-coveralls"
        git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
        cd "${srcdir}/cpp-coveralls"
        python setup.py build
}

package() {
        cd "${srcdir}/cpp-coveralls"
        python setup.py install \
                -O2 --skip-build --root "${pkgdir}" --prefix=/usr
        install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/cpp-coveralls"
}

# vim: set ts=8 sw=8 et:
