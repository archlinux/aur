#Maintainer: "Yannick LM <yannicklm1337 AT gmail DOT com>"

pkgname=pycp
pkgver="7.2.1"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/yannicklm/pycp"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools' 'help2man')
source=("http://pypi.python.org/packages/source/p/pycp/pycp-${pkgver}.tar.gz")
md5sums=('1f5230b618c5dc616d7f3e96bb03f110')

build() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1

  # man pages
  PYTHONPATH=. help2man --no-info --output pycp.1 ${pkgdir}/usr/bin/pycp
  PYTHONPATH=. help2man --no-info --output pymv.1 ${pkgdir}/usr/bin/pymv
  mkdir -p $pkgdir/usr/share/man/man1
  install pycp.1 $pkgdir/usr/share/man/man1/pycp.1
  install pymv.1 $pkgdir/usr/share/man/man1/pymv.1

  # license
  mkdir -p $pkgdir/usr/share/licenses/pycp
  install COPYING.txt $pkgdir/usr/share/licenses/pycp/COPYING
}

# vim:set ts=2 sw=2 et:
