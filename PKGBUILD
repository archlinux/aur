# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=arronax
pkgver=0.06
pkgrel=3
pkgdesc='A program to create and modify starters/launchers (technically: .desktop files) for applications and locations (URLs).'
arch=('any')
license=('GPL3')
url="http://www.florian-diesch.de/software/arronax/"
depends=('python2-gobject' 'desktop-file-utils' 'python2-setuptools' 'python2-xdg')
makedepends=('python2-distutils-extra')
optdepends=('python2-nautilus: Arronax as Nautilus extension')

source=(http://www.florian-diesch.de/software/$pkgname/dist/$pkgname-$pkgver.tar.gz)

md5sums=('bc09b05169f2b5dd190ca8c25f93cd6a')

prepare() {
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'  "$srcdir"/$pkgname-$pkgver/nautilus/nautilus-$pkgname.py
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'  "$srcdir"/$pkgname-$pkgver/debian/$pkgname-base/usr/bin/$pkgname
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 ./setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 ./setup.py install --root="$pkgdir"
}

