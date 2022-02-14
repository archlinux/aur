# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-pysmt-git
pkgdesc="A library for SMT formulae manipulation and solving"
url="https://github.com/pysmt/pysmt"
pkgver=0.9.0.r151.ga32cd27
pkgrel=1
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-six')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('Apache')
source=("$pkgname::git+https://github.com/pysmt/pysmt#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
