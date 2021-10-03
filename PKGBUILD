# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-kucoin-git"
pkgver=2.1.1.r14.gd7ba653
pkgrel=1
pkgdesc="Unofficial Python wrapper for KuCoin's API"
arch=('any')
url="https://github.com/sammchardy/${pkgname%-git}"
license=('MIT')
depends=('python-requests')
makedepends=('git' 'python-setuptools')
source=("git+${url}.git")
md5sums=('SKIP')


pkgver() {
    cd "${srcdir}"/${pkgname%-git}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
    cd "${srcdir}"/${pkgname%-git}
    python setup.py build
}

package() {
    cd "${srcdir}"/${pkgname%-git}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
