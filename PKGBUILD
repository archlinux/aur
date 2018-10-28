# $Id: PKGBUILD 197396 2016-11-29 17:37:31Z spupykin $
# Maintainer: Will A Cadegan-Schlieper <aur@covering.space>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Samuel Mathieson <smathieson@gmail.com>

pkgname=moinmoin
_xpkgname=moin
pkgver=1.9.10
pkgrel=1
pkgdesc="A python wiki clone"
arch=(any)
url="http://moinmo.in/"
license=('GPL')
depends=('python2')
conflicts=('moin')
install=moinmoin.install
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393')
source=("https://static.moinmo.in/files/moin-$pkgver.tar.gz"{,.asc})

sha256sums=('4a264418e886082abd457c26991f4a8f4847cd1a2ffc11e10d66231da8a5053c'
            'SKIP')

prepare() {
  cd "$srcdir"/${_xpkgname}-$pkgver
  # python2 fix
  for file in $(find . -name '*.py' -print) wiki/server/*; do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

build() {
  cd "$srcdir"/${_xpkgname}-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/${_xpkgname}-$pkgver
  python2 setup.py install --root="$pkgdir" --record=INSTALLED_FILES
}
