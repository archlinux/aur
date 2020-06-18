# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python2-urwid
pkgver=2.1.0
pkgrel=1
pkgdesc='Curses-based user interface library'
url='http://excess.org/urwid/'
arch=('x86_64')
license=('LGPL')
depends=('python2' 'glibc')
makedepends=('glibc' 'python2-setuptools')
source=(https://github.com/urwid/urwid/archive/release-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2f35d3416f85c6ad3247fc37af450b342466827d8256512f4d28064c0020bca0')
sha512sums=('14267d1076e51ef53dc187dc1395e9f4d968bc1019c2fc2209143eb29b9b138a378116fae30645f1183b2378ffe43ee3491de6181a51699f933970385012abe1')

build() {
  (cd urwid-release-${pkgver}
    python2 setup.py build
  )
}

check() {
  (cd urwid-release-${pkgver}
    python2 setup.py test
  )
}

package() {
  cd urwid-release-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/urwid/tests
}

# vim: ts=2 sw=2 et:
