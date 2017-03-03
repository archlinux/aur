# Maintainer: takeshix <deen [at] adversec [dot] com>

_gitname=deen
pkgname="${_gitname}-git"
pkgver=0.7.8.de5cb55
pkgrel=1
pkgdesc='Generic data encoding/decoding application built with PyQt5'
url='https://github.com/takeshixx/deen'
arch=('any')
license=('Apache 2.0')
depends=('python' 'python-pip')
optdepends=('python-openssl')
makedepends=('git')
provides=('deen')
conflicts=('deen')
source=("${_gitname}::git://github.com/takeshixx/deen.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "%s.%s" "$(git describe --tags --abbrev=0|sed 's/^v//'|sed 's/\-/_/')" \
                 "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_gitname}
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
  python -O -m compileall .
}

# vim: ts=2 sw=2
