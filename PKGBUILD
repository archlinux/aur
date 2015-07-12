# Maintainer	- mawcomw <mawcomw@gmail.com>
# Contributor	- Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgbase=python-rfc6266
pkgname=('python2-rfc6266' 'python-rfc6266')
pkgver=0.0.4
pkgrel=1
arch=('any')
url="https://github.com/g2p/rfc6266"
license=('LGPL')
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=( https://pypi.python.org/packages/source/r/rfc6266/rfc6266-$pkgver.tar.gz 
		'LGPL-3.0.txt' )
md5sums=( '772b711de0bf9fc9277fe91e7b53060c'
			'e6a600fd5e1d9cbde2d983680233ad02' )

prepare() {
   mv rfc6266-$pkgver python-rfc6266-${pkgver}
   cp -r python-rfc6266-${pkgver} python2-rfc6266-${pkgver}
}

build() {
   cd $srcdir/python-rfc6266-${pkgver}
   python setup.py build
   
   cd $srcdir/python2-rfc6266-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/python-rfc6266-${pkgver}
#   python setup.py test
#   
#   cd $srcdir/python2-rfc6266-${pkgver}
#   python2 setup.py test
#}

package_python-rfc6266() {
   depends=('python' )
   pkgdesc="A Python3 Content-Disposition header support (RFC6266)"
   
   cd python-rfc6266-${pkgver}
   python setup.py install --root="${pkgdir}" --optimize=1

   cd ..
   install -Dm644 LGPL-3.0.txt "${pkgdir}"/usr/share/licenses/$pkgname/LGPL-3.0.txt
}

package_python2-rfc6266() {
   depends=('python2' )
   pkgdesc="A Python2 Content-Disposition header support (RFC6266)"

   cd python2-rfc6266-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1

   cd ..
   install -Dm644 LGPL-3.0.txt "${pkgdir}"/usr/share/licenses/$pkgname/LGPL-3.0.txt
}