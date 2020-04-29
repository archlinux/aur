# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-liblarch
pkgver=2.1
pkgrel=2
pkgdesc="Python library to easily handle data structure"
arch=('any')
url="https://wiki.gnome.org/action/show/Projects/liblarch"
license=('LGPL3')
depends=('python2')
optdepends=()
makedepends=('python2' 'python2-distribute')
checkdepends=('python2-nose')
provides=('python2-liblarch_gtk')
conflicts=('python2-liblarch_gtk')
source=("https://github.com/liblarch/liblarch/archive/v${pkgver}.tar.gz")
sha256sums=('2b1bb070f114be3f306d2b40814bc270ea0996eb6f468f004eb114c2e1611e1d')

check() {
  cd "$srcdir/liblarch-${pkgver}"
  python2 run-tests
}

package() {
  cd "$srcdir/liblarch-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  find "$pkgdir"/usr/lib/python2.7/site-packages/liblarch -name '*.py' | \
  xargs sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|"
}


# vim:set ts=2 sw=2 et:
