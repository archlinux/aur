# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=httpobs-git
_pkgname=httpobs
pkgver=r657.92641c6
pkgrel=1
pkgdesc='A command line tool to scan your website'
arch=('any')
url='https://github.com/mozilla/http-observatory'
license=('custom:MPL2')
depends=('python-celery' 'python-beautifulsoup4' 'python-publicsuffixlist')
makedepends=('python-setuptools' 'git')
provides=('httpobs')
conflicts=('httpobs')
source=(
    "$_pkgname::git+https://github.com/mozilla/http-observatory"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (   
        set -o pipefail
        git describe --long 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
