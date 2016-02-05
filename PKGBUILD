#Maintainer:  David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-hstore')
pkgname=('python-django-hstore')
_module='django-hstore'
pkgver='1.4.1'
pkgrel=1
pkgdesc="PostgreSQL HStore support for Django"
url="https://github.com/djangonauts/django-hstore"
depends=('python' 'python-django' 'python-psycopg2')
makedepends=('python-setuptools' 'asciidoc' 'pygmentize')
license=('BSD')
arch=('any')
install=python-django-hstore.install
source=("https://pypi.python.org/packages/source/d/django-hstore/django-hstore-${pkgver}.tar.gz"
        "python-django-hstore.install")
sha256sums=('0d91e12308bc42098831222ae9fd94e4d071c905926bc45310697e0f1bcfdb18'
            '94ddead2cdecbc6a69f55c1b5eceb5bb0774e81ceb21c65aba338581d263e057')

build() {
    cd "${srcdir}/${_module}-${pkgver}/doc"
    make
}

#Note: tests depend on django-discover-runner.  no check() implemented yet

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    mkdir -p $pkgdir/usr/share/doc/python-django-hstore/html/
    cp -rf doc/* $pkgdir/usr/share/doc/python-django-hstore/html/
    find $pkgdir/usr/share/doc/python-django-hstore/html/ -type f -exec chmod 0644 {} \;
    find $pkgdir/usr/share/doc/python-django-hstore/html/ -type d -exec chmod 0755 {} \;
}

