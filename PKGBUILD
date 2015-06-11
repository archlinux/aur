# Maintainer: James An <james@jamesan.ca>

_pkgname=speedtest-cli
pkgname="$_pkgname-git"
pkgver=0.3.2.r12.g514b310
pkgrel=1
pkgdesc='Command line interface for testing internet bandwidth using speedtest.net - git devel branch'
arch=('any')
url="https://github.com/sivel/$_pkgname"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/sivel/$_pkgname.git#branch=devel")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) | sed 's/^v//' # remove leading letter v
}

package(){
    cd $_pkgname

    python setup.py install install --root="$pkgdir/" --optimize=1
}
