# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=zerodb-git
pkgname=("python-zerodb-git" "python2-zerodb-git")
pkgver=r384.2963885
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol client"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
#source=("zerodb.zip::https://github.com/zero-db/zerodb/archive/master.zip")
source=("zerodb::git+https://github.com/zero-db/zerodb#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/zerodb"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package_python-zerodb-git() {
    depends=('python', 'python-setuptools' 'python-transaction')
    cd "${srcdir}/zerodb"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-zerodb-git() {
    depends=('python2', 'python2-setuptools' 'python2-transaction')
    cd "${srcdir}/zerodb"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
