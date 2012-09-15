# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgbase=python-nose
pkgname=('python-nose' 'python2-nose' 'python-nose-doc')
pkgver=1.2.1
pkgrel=1
pkgdesc="A discovery-based unittest extension"
arch=('any')
url='http://readthedocs.org/docs/nose/'
license=('LGPL2.1')
makedepends=('python' 'python-distribute' 'python2' 'python2-distribute' 'python2-sphinx')
source=("http://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz")
md5sums=('735e3f1ce8b07e70ee1b742a8a53585a')

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
  make SPHINXBUILD=sphinx-build2 html
  mkdir -p "$pkgdir/usr/share/doc/python-nose"
  cp -r .build/html "$pkgdir/usr/share/doc/python-nose"
  cp -r ../examples "$pkgdir/usr/share/doc/python-nose"
}
