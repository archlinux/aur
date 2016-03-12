# -*- mode: sh; -*-
# Maintainer: Tom Willemse <tom@ryuslash.org>

_python=python2
_name=DisPass

pkgname=$_python-dispass-git
pkgver=20160311
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
    $_python setup.py install --root="$pkgdir"

    install -Dm644 "${srcdir}/${_name}/skel/labelfile" \
        "${pkgdir}/etc/skel/.dispass/labels"
    install -Dm644 "${srcdir}/${_name}/dispass.1" \
        "${pkgdir}/usr/share/man/man1/dispass.1"
    install -Dm644 "${srcdir}/${_name}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_name}/README.rst" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -Dm644 "${srcdir}/${_name}/zsh/_dispass" \
        "${pkgdir}/usr/share/zsh/site-functions/_dispass"

    install -Dm644 "${srcdir}/${_name}/logo/logo32.png" \
            "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dispass.png"
    install -Dm644 "${srcdir}/${_name}/logo/logo64.png" \
            "${pkgdir}/usr/share/icons/hicolor/64x64/apps/dispass.png"
    install -Dm644 "${srcdir}/${_name}/logo/logo128.png" \
            "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dispass.png"
    install -Dm644 "${srcdir}/${_name}/logo/logo256.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dispass.png"
    install -Dm644 "${srcdir}/${_name}/logo/logo512.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dispass.png"

    install -Dm644 "${srcdir}/dispass.desktop" \
            "${pkgdir}/usr/share/applications/dispass.desktop"
}
