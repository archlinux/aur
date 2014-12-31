# Maintainer: James An <james@jamesan.ca>

pkgname=speedtest-cli-git
_gitname=speedtest-cli
pkgver=0.3.1.r3.gb0e1e58
pkgrel=1
pkgdesc='Command line interface for testing internet bandwidth using speedtest.net - git devel branch'
arch=('any')
url='https://github.com/sivel/speedtest-cli'
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=($_gitname)
provides=($_gitname)
source=("git+https://github.com/sivel/speedtest-cli.git#branch=devel")
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) | sed 's/^v//' # remove leading letter v
}

package(){
    cd $_gitname

    python setup.py install install --root="$pkgdir/" --optimize=1
}
