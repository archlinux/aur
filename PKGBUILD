# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=ipycli-git
pkgver=r135.baa33ed
pkgrel=1
pkgdesc="IPython subapp that supports adding arbitrary notebooks from the command line"
arch=('i686' 'x86_64')
url="https://github.com/dalejung/ipycli/"
license=('BSD')
depends=('python2' 'ipython2')
optdepends=()
makedepends=('git' 'python2')
install=
provides=()
conflicts=()
source=("git://github.com/dalejung/ipycli.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/ipycli"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/ipycli"
  #lib
  python2 setup.py install --root="${pkgdir}"

  #bin
  mkdir "${pkgdir}/usr/bin"
  cp "bin/nb" "${pkgdir}/usr/bin"
  sed -i -e "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" "${pkgdir}/usr/bin/nb"
  cp "bin/ipycli" "${pkgdir}/usr/bin"
  sed -i -e "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" "${pkgdir}/usr/bin/ipycli"

  #templates/statics
  cp -r "ipycli/static" "${pkgdir}/usr/lib/python2.7/site-packages/ipycli/"
  cp -r "ipycli/templates" "${pkgdir}/usr/lib/python2.7/site-packages/ipycli/"
}
# vim:set ts=2 sw=2 et:
