# Maintainer: mawcomw <mawcomw@gmail.com>

pkgbase=python-argparse
pkgname=('python-argparse' 'python2-argparse')
pkgver=1.3.0
pkgrel=2
arch=('any')
url="https://pypi.python.org/pypi/argparse"
license=('CUSTOM')
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/a/argparse/argparse-$pkgver.tar.gz")
md5sums=('9bcf7f612190885c8c85e30ba41db3c7')

prepare() {
   cp -r argparse-${pkgver} python2-argparse-${pkgver}
}

build() {
   cd $srcdir/argparse-${pkgver}
   python setup.py build
   
   cd $srcdir/python2-argparse-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/argparse-${pkgver}
#   python2 setup.py test
#   
#   cd $srcdir/python2-argparse-${pkgver}
#   python setup.py test
#}

package_python-argparse() {
   depends=('python' )
   pkgdesc="Python3 command-line parsing library"

   cd argparse-${pkgver}
   python setup.py install --root="${pkgdir}" --optimize=1

   install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-argparse() {
   depends=('python2' )
   pkgdesc="Python2 command-line parsing library"
   
   cd python2-argparse-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

   install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}
