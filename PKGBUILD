# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-objection
pkgver=1.9.6
pkgrel=1
pkgdesc="runtime mobile exploration"
arch=(x86_64)
url=https://github.com/sensepost/objection
license=(GPL3)
depends=(python python-flask python-click python-frida python-frida-tools python-tabulate python-prompt_toolkit python-delegator nodejs litecli)
makedepends=(python-setuptools npm)
source=(https://github.com/sensepost/objection/archive/${pkgver}.tar.gz)
sha256sums=('216bd3f9bd4b24706be0e6160994f6370e331fe68c3beda7d01235c12a33ee18')

prepare() {
  cd objection-${pkgver}
  #versioneer install 
}

build() {
  cd objection-${pkgver}
  python setup.py build

  cd agent
  npm install
}

check() {
  cd objection-${pkgver}
  python -m unittest
}

package() {
  cd objection-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  cd "${pkgdir}"
  find . -name tests | xargs rm -rf
  cp "${srcdir}/objection-${pkgver}/objection/agent.js" "$(find . -name objection -type d)/."
}

# vim:ts=2:sw=2:et:
