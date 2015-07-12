# Maintainer: mawcomw <mawcomw@gmail.com>

pkgbase=python-django-reversion
pkgname=('python-django-reversion' 'python2-django-reversion')
pkgver=1.8.5
pkgrel=1
arch=(any)
url="http://github.com/etianen/django-reversion"
license=('BSD')
makedepends=( 'python2' 'python2-setuptools' 'python' 'python-setuptools' )
source=( "https://pypi.python.org/packages/source/d/django-reversion/django-reversion-$pkgver.tar.gz" )
md5sums=( '2de5a3fe82aaf505c134570f96fcc7a8' )

prepare() {
   cp -r django-reversion-${pkgver} python2-django-reversion-${pkgver}
}

build() {
   cd $srcdir/django-reversion-${pkgver}
   python setup.py build

   cd $srcdir/python2-django-reversion-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/django-reversion-${pkgver}
#   python setup.py test
#   
#   cd $srcdir/python2-django-reversion-${pkgver}
#   python2 setup.py test
#}

package_python-django-reversion() {
   depends=('python' )
   pkgdesc="An python3 extension to the Django web framework that provides comprehensive version control facilities"

   cd $srcdir/django-reversion-${pkgver}
   python setup.py install --root="$pkgdir" --optimize=1 

   install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-django-reversion() {
   depends=('python2' )
   pkgdesc="An python2 extension to the Django web framework that provides comprehensive version control facilities"
   
   cd python2-django-reversion-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

   install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
