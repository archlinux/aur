# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgbase=python-nose
pkgname=('python-nose' 'python2-nose')
pkgver=1.3.7
pkgrel=10
pkgdesc="A discovery-based unittest extension"
arch=('any')
url='https://readthedocs.org/docs/nose/'
license=('LGPL2.1')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz"{,.asc})
sha512sums=('e65c914f621f8da06b9ab11a0ff2763d6e29b82ce2aaed56da0e3773dc899d9deb1f20015789d44c65a5dad7214520f5b659b3f8d7695fb207ad3f78e5cf1b62'
            'SKIP')
validpgpkeys=('58B277C0D208F7AC460C07C84548B3A8C0D70C12') # John Szakmeister <john@szakmeister.net>

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
  cp -R "$srcdir/nose-$pkgver" "$srcdir/nose2-$pkgver"
}

package_python-nose() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/nose-$pkgver"
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
  ln -s nosetests "$pkgdir/usr/bin/nosetests3"
}

package_python2-nose() {
  depends=('python2' 'python2-setuptools')
  cd "$srcdir/nose2-$pkgver"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  mv "$pkgdir/usr/bin/nosetests" "$pkgdir/usr/bin/nosetests2"
  rm -rf "$pkgdir/usr/share"
}
