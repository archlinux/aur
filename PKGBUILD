# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

_pkgbase=python-dbussy
# _name=${_pkgbase#python-}
pkgname="${_pkgbase}-git"
pkgver=1.1.r3.g3a7ae2f
pkgrel=1
pkgdesc="Python binding for D-Bus using asyncio"
arch=(any)
url="https://github.com/ldo/dbussy"
license=('LGPL')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+https://github.com/ldo/dbussy.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
