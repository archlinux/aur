# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

_hgname=mutagen
pkgname=mutagen-hg
pkgver=r0
pkgrel=1
pkgdesc="An audio metadata tag reader and writer, mercurial version"
arch=('any')
url="http://code.google.com/p/mutagen/"
license=('GPL2')
depends=('python2')
makepends=('mercurial')
conflicts=('mutagen')
provides=('mutagen')
source=(hg+https://code.google.com/p/$_hgname/)
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_hgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/$_hgname"

  python2 setup.py install --root="${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  install -m755 tools/* "${pkgdir}/usr/bin"
  sed -i 's|^#!.*/usr/bin/env.*python|#!/usr/bin/env python2|' "${pkgdir}"/usr/bin/* \
    "${pkgdir}/usr/lib/python2.7/site-packages/mutagen/__init__.py"
}
