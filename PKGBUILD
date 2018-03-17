# Maintainer: James An <james@jamesan.ca>

pkgname=speedtest-cli-git
_pkgname=${pkgname%-git}
pkgver=2.0.0.r0.g0a7823d
pkgrel=1
pkgdesc='Command line interface for testing internet bandwidth using speedtest.net'
arch=('any')
url="https://github.com/sivel/$_pkgname"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/sivel/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package(){
    cd $_pkgname

    python setup.py install --root="$pkgdir" --optimize=1
}
