# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-yaql' 'python2-yaql')
pkgver='1.1.3'
pkgrel='1'
pkgdesc='Yet Another Query Language'
arch=('any')
url='https://yaql.readthedocs.io'
license=('Apache')
source=("git+https://git.openstack.org/openstack/yaql#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a yaql{,-py2}
}

build() {
  cd "$srcdir"/yaql
  python setup.py build

  cd "$srcdir"/yaql-py2
  python2 setup.py build
}

package_python-yaql() {
  depends=('python-six' 'python-pbr' 'python-babel' 'python-dateutil' 'python-ply')

  cd "$srcdir"/yaql
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-yaql() {
  depends=('python2-six' 'python2-pbr' 'python2-babel' 'python2-dateutil' 'python2-ply')

  cd "$srcdir"/yaql-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "${pkgdir}"/usr/bin/yaql{,2}
}

# vim:set ts=2 sw=2 et:
