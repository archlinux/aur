# Maintainer: Renato Garcia <fgar.renatoATgmailDOTcom>
pkgname=trash-cli
pkgver=0.11.3_r315
pkgrel=4
pkgdesc="Command line trashcan (recycle bin) interface"
arch=('i686' 'x86_64')
url="http://code.google.com/p/trash-cli/"
license=('GPL')
depends=('python2' 'python-unipath>=0.2.0' 'python2-distribute')
source=(http://trash-cli.googlecode.com/files/${pkgname}-${pkgver/_/-}.tar.gz
        python2.patch
        empty_days.patch)
md5sums=('00654c149108fc4c522b5b008e9b8468'
         'a187680f9f1c3f6e8730cabfff6fc9c8'
         '60d9034aff7159ff9220a9fa890a6a9d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"

  patch -p1 < ../python2.patch
  patch -p1 < ../empty_days.patch
  python2 setup.py build
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"

  python2 setup.py install --root=${pkgdir}

  cd ${pkgdir}
  mkdir ./usr/share
  mv ./usr/man ./usr/share/man
}
