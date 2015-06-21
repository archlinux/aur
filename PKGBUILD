# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=mutagen-hg
pkgdesc="An audio metadata tag reader and writer, mercurial version"
license=('GPL2')
url="http://code.google.com/p/mutagen/"
pkgver=r1102.b27f57a13d47
pkgrel=1

conflicts=('mutagen')
provides=('mutagen')

source=("$pkgname::hg+https://bitbucket.org/lazka/mutagen")
md5sums=('SKIP')
depends=('python2')
makepends=('mercurial')
arch=('any')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
    cd "$srcdir/$pkgname"

    python2 setup.py install --root="${pkgdir}"
    install -d "${pkgdir}/usr/bin"
    install -m755 tools/* "${pkgdir}/usr/bin"
    sed -i 's|^#!.*/usr/bin/env.*python|#!/usr/bin/env python2|' "${pkgdir}"/usr/bin/* \
      "${pkgdir}/usr/lib/python2.7/site-packages/mutagen/__init__.py"
}
