# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=python2-pypam
pkgver=1.0.6
pkgrel=1
pkgdesc="PAM module that runs the Python interpreter and so allows PAM modules to be written in Python."
arch=('x86_64')
url="http://pam-python.sourceforge.net/"
license=('AGPL3')
depends=('python2')
options=('!strip' '!emptydirs')
makedepends=('python2-sphinx')
source=(
    "https://downloads.sourceforge.net/project/pam-python/pam-python-1.0.6-1/pam-python-1.0.6.tar.gz"
)

md5sums=('2da730f15d62b10b87e1f18c21e16fb4')

build() {
  cd pam-python-${pkgver}
  sed -i'' 's|#!/usr/bin/python -W default|#!/usr/bin/python2 -W default|g' src/setup.py
  sed -i'' 's|#!/usr/bin/python -W default|#!/usr/bin/python2 -W default|g' src/test.py
  sed -i'' 's|LIBDIR ?= /lib/security|LIBDIR ?= /usr/lib/security|g' src/Makefile
  sed -i'' 's|sphinx-build|sphinx-build2|g' doc/Makefile

  make
}

package() {
  cd pam-python-${pkgver}
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
