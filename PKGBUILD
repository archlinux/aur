# Maintainer: mawcomw <mawcomw@gmail.com>

pkgbase=python-dj-database-url
pkgname=('python-dj-database-url' 'python2-dj-database-url')
pkgver=0.3.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/kennethreitz/dj-database-url"
license=('BSD')
makedepends=('python2' 'python')
source=("https://pypi.python.org/packages/source/d/dj-database-url/dj-database-url-$pkgver.tar.gz")
md5sums=('28f89d403b565ee62dc25582852ae241')

prepare() {
   cp -r dj-database-url-${pkgver} python2-dj-database-url-${pkgver}
}

build() {
   cd $srcdir/dj-database-url-${pkgver}
   python setup.py build
   
   cd $srcdir/python2-dj-database-url-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/dj-database-url-${pkgver}
#   python setup.py test
#
#   cd $srcdir/python2-dj-database-url-${pkgver}
#   python2 setup.py test
#}

package_python-dj-database-url() {
   pkgdesc="A simple Python3 utility that allows you to utilize the 12factor inspired DATABASE_URL environment variable to configure your Django application."
   depends=('python')

   cd dj-database-url-${pkgver}
   python setup.py install --root="${pkgdir}" --optimize=1
   
   #install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-dj-database-url() {
   pkgdesc="A simple Python2 utility that allows you to utilize the 12factor inspired DATABASE_URL environment variable to configure your Django application."
   depends=('python2')
   
   cd python2-dj-database-url-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1
   
   #install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}