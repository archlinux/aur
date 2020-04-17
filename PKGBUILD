# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-objection
pkgver=1.9.1
pkgrel=1
pkgdesc="runtime mobile exploration"
arch=('any')
url=https://github.com/sensepost/objection
license=('GPLv3')
depends=(python python-flask python-click python-frida python-frida-tools python-tabulate python-prompt_toolkit python-delegator nodejs litecli)
makedepends=('python-setuptools')
source=(https://github.com/sensepost/objection/archive/${pkgver}.tar.gz)
sha256sums=('1351f0b6ddb0e4c370912f2e2d790a5663fa50df9bb515842ee76a0412fec94d')

prepare() {
  cd "$srcdir/objection-$pkgver/"
  #versioneer install 
}

build() {
  cd "$srcdir/objection-$pkgver/"
  python setup.py build

  cd agent
  npm install
}

check() {
  cd "$srcdir/objection-$pkgver/"
  python -m unittest
}

package() {
  cd "$srcdir/objection-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  cd "${pkgdir}"
  find . -name tests | xargs rm -rf
  cp "${srcdir}/objection-${pkgver}/objection/agent.js" "$(find . -name objection -type d)/."
}

# vim:ts=2:sw=2:et:
