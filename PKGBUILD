# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: Akshay Srinivasan <akshaysrinivasan@gmail.com>
pkgname=python2-pp
pkgver=1.6.4
pkgrel=1
pkgdesc="Parallel and distributed programming for Python 2"
arch=('i686' 'x86_64')
depends=('python2>=2.5')
url="http://www.parallelpython.com"
license=('BSD-like license')
source=("http://www.parallelpython.com/downloads/pp/pp-$pkgver.tar.gz")
sha256sums=('fa271f17641e069f19e25d352885e3a475797c657b30e433d8227c3d882163fa')

build() {
  cd $srcdir/pp-$pkgver/

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd $srcdir/pp-$pkgver/

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
