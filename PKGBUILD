# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgbase=python-nose
pkgname=('python-nose' 'python2-nose' 'python-nose-doc')
pkgver=1.1.2
pkgrel=3
pkgdesc="A discovery-based unittest extension"
arch=('any')
url="http://www.somethingaboutorange.com/mrl/projects/nose/"
license=('LGPL2')
makedepends=('python' 'python-distribute' 'python2' 'python2-distribute' 'python-sphinx')
source=(http://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz{,.asc})
md5sums=('144f237b615e23f21f6a50b2183aa817'
         'b3ea70c42347d9ca8b1c248bd6b128c5')

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
  cp -R "$srcdir/nose-$pkgver" "$srcdir/nose2-$pkgver"
}

package_python-nose() {
  depends=('python' 'python-distribute')
  cd "$srcdir/nose-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}"
  mv "$pkgdir/usr/bin/nosetests" "$pkgdir/usr/bin/nosetests3"
}

package_python2-nose() {
  depends=('python2' 'python2-distribute')
  cd "$srcdir/nose2-$pkgver"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  mv "$pkgdir/usr/bin/nosetests" "$pkgdir/usr/bin/nosetests2"
  rm -rf "$pkgdir/usr/share"
}

package_python-nose-doc(){
  pkgdesc="Nose documentation and examples"
  cd "$srcdir/nose-$pkgver/doc"
  make html
  mkdir -p "$pkgdir/usr/share/doc/python-nose"
  cp -r .build/html "$pkgdir/usr/share/doc/python-nose"
  cp -r ../examples "$pkgdir/usr/share/doc/python-nose"
}
