# -*- mode: sh; -*-
# Maintainer: Tom Willemse <tom@ryuslash.org>

_python=python2
_name=DisPass

pkgname=$_python-dispass-git
pkgver=20160313
pkgrel=1
pkgdesc="Generate and disperse/dispell passwords"
depends=('python2' 'python2-pycommand')
makedepends=('python2-distribute' 'git')
optdepends=('tk: for gdispass')
arch=('any')
source=("git://github.com/babab/$_name.git"
        dispass.desktop)
url="http://dispass.babab.nl/"
license=("custom:ISC")
conflicts=(python2-dispass)
md5sums=('SKIP'
         '16168222774d693d5ade0d88aba4f35e')
install=dispass.install

pkgver() {
    cd "$srcdir"/"$_name"
    git log -1 --pretty=format:"%cd" --date=short | sed s/-//g
}

build() {
    cd "$srcdir"/"$_name"
    $_python setup.py build || return 1
}

package() {
    cd "$srcdir/$_name"
    make install-src DESTDIR="$pkgdir"

    install -Dm644 "${srcdir}/${_name}/skel/labelfile" \
        "${pkgdir}/etc/skel/.dispass/labels"
    install -Dm644 "${srcdir}/${_name}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_name}/README.rst" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
