# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-objection
pkgver=1.8.2
pkgrel=1
pkgdesc="runtime mobile exploration"
arch=('any')
url=https://github.com/sensepost/objection
license=('GPLv3')
depends=(python python-flask python-click python-frida python-frida-tools python-tabulate python-prompt_toolkit python-delegator nodejs)
makedepends=('python-setuptools')
source=(https://github.com/sensepost/objection/archive/${pkgver}.tar.gz)
sha256sums=('e32e97e98401bb4708918f752d40009ee2de80444e5ec9297d099e853375dcf1')

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

package() {
  cd "$srcdir/objection-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  cd "${pkgdir}"
  find . -name tests | xargs rm -rf
  cp "${srcdir}/objection-${pkgver}/objection/agent.js" "$(find . -name objection -type d)/."
}

# vim:ts=2:sw=2:et:
