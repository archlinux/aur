# Maintainer: André <andre-arch@delorus.de>
pkgname=fittotcx-git
_gitname=FIT-to-TCX
pkgver=r13.22348b0
pkgrel=1
pkgdesc="This program takes a FIT file and converts it into an TCX file and output the result to the standard output"
arch=('i686' 'x86_64')
source=(git+https://github.com/Tigge/FIT-to-TCX)
url="https://github.com/Tigge/FIT-to-TCX"
license=("custom:fittotcx")
depends=('python2' 'python2-lxml' 'python2-fitparse-git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 unitconvert.py ${pkgdir}/usr/lib/python2.7/site-packages/unitconvert.py

  sed -i-e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" fittotcx.py
  install -Dm755 fittotcx.py ${pkgdir}/usr/bin/fittotcx

  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/fittotcx/LICENSE
}
