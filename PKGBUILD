# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=pygccxml-svn
pkgver=1856
pkgrel=1
pkgdesc="Read a generated file and provide a simple framework to navigate C++ declarations in Python."
arch=(i686 x86_64 arm)
url="http://www.sourceforge.net/projects/pygccxml"
license=(boost)
depends=('gccxml-git' 'python2')
options=(!strip)

source=(
    "${pkgname}::svn+http://svn.code.sf.net/p/pygccxml/svn/pygccxml_dev"
    #"${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/pygccxml/files/pygccxml/pygccxml-1.0/pygccxml-${pkgver}.zip"
    )
md5sums=(
    'SKIP'
    #'44badbf8c4bcd3095290a90f2f2a9234'
    )

conflicts=(pygccxml)

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_svn
}

build4svn() {
    cd "${srcdir}/${pkgname}"
    python2 setup.py build
}

build4release() {
    cd "${srcdir}/pygccxml-${pkgver}"
    python2 setup.py build
}

build () {
    build4svn
}

package4svn() {
    cd "${srcdir}/${pkgname}"
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}

package4release() {
    cd "$srcdir/pygccxml-${pkgver}"
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}

package() {
    package4svn
}
