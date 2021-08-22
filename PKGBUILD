# Maintainer: Roberto Anic Banic <nicba1010@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python2-urwid
pkgver=2.1.2
pkgrel=1
pkgdesc='Curses-based user interface library'
url='https://urwid.org/'
arch=('x86_64')
license=('LGPL')
depends=('python2' 'glibc')
makedepends=('glibc' 'python2-setuptools' 'python2-mock' 'python-tox')
source=(https://github.com/urwid/urwid/archive/release-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('366970cabce4a7f70fb4af1d16ac8be23dbcf38f995a20029a4bf32fffe7607d')
sha512sums=('8f4d95d8f016d97ab4706287c6827a61a45ace736975cc242a0a01451cbf5200285b55f95f86199fb9da6573ab8ef6a9063a8be0e46740bb515670e9986c729b')

build() {
  (cd urwid-release-${pkgver}
    python2 setup.py build
  )
}

check() {
  (cd urwid-release-${pkgver}
    tox -e py27
  )
}

package() {
  cd urwid-release-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/urwid/tests
}

# vim: ts=2 sw=2 et:
