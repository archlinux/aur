# Maintainer: h8red <h8red@yandex.ru>
pkgname=bcnc-git
pkgver=r1524.bb22b26
pkgrel=1
pkgdesc="GRBL CNC command sender, autoleveler and g-code editor"
arch=('any')
url="https://github.com/vlachoudis/bCNC"
license=('GNU2')
depends=('python2-pyserial' 'python2-pillow' 'python2-numpy' 'python2-scipy')
makedepends=('git')
provides=("${pkgname%}")
source=("git+https://github.com/vlachoudis/bCNC.git"
        "${pkgname}"
        "${pkgname}.desktop")
md5sums=('SKIP'
         '56c919f0a53eb5712cb364ffd36b236d'
         'ef176d74a7958e03a2ea0164d05291da')

pkgver() {
    cd "$srcdir/bCNC"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd "$srcdir/bCNC"
    python2 -O -m py_compile *.py
}


package() {
    install -D -m755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -D -m644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    cd "$srcdir/bCNC/bCNC"
    install -D -m644 "bCNC.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages/bCNC-git"
    cp -r * "${pkgdir}/usr/lib/python2.7/site-packages/bCNC-git"
}