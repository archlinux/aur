# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-reno' 'python2-reno')
pkgver='2.2.0'
pkgrel='1'
pkgdesc='OpenStack release notes manager'
arch=('any')
url='http://docs.openstack.org/developer/reno'
license=('Apache')
source=("git+https://git.openstack.org/openstack/reno#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a reno{,-py2}
}

build() {
  cd "$srcdir"/reno
  python setup.py build

  cd "$srcdir"/reno-py2
  python2 setup.py build
}

package_python-reno() {
  depends=('python-pbr' 'python-babel' 'python-yaml' 'python-six')

  cd "$srcdir"/reno
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-reno() {
  depends=('python2-pbr' 'python2-babel' 'python2-yaml' 'python2-six')

  cd "$srcdir"/reno-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "${pkgdir}"/usr/bin/reno{,2}
}

# vim:set ts=2 sw=2 et:
