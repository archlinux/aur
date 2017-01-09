# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Dieter_be

_pkgbase=gensim
pkgbase=python-gensim
pkgname=('python-gensim' 'python2-gensim')
pkgver=0.13.4.1
pkgrel=1
pkgdesc="Python framework for fast Vector Space Modelling"
arch=('i686' 'x86_64')
url="http://nlp.fi.muni.cz/projekty/gensim/"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-scipy' 'python2-scipy' 'cython' 'cython2' 'python-six' 'python2-six')
source=("http://pypi.python.org/packages/source/g/$_pkgbase/$_pkgbase-${pkgver//_/-}.tar.gz")
md5sums=('baa36f0b845162abeadd1bb66511a53c')


prepare() {
    cp -r $_pkgbase-${pkgver//_/-} $_pkgbase-${pkgver//_/-}-py2
}

build() {
    unset LDFLAGS
    unset FFLAGS

    cd ${srcdir}/$_pkgbase-${pkgver//_/-}
    python setup.py build

    cd ${srcdir}/$_pkgbase-${pkgver//_/-}-py2
    python2 setup.py build
}

#test() {
#    python2 setup.py test
#}

package_python-gensim() {
    pkgdesc+=" (Python3.x)"
    depends=(python-scipy)

    cd ${srcdir}/$_pkgbase-${pkgver//_/-}
    python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-gensim() {
    pkgdesc+=" (Python2.x)"
    depends=(python2-scipy)

    cd ${srcdir}/$_pkgbase-${pkgver//_/-}-py2
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}
