pkgname=eliza
pkgver=1969
pkgrel=3
pkgdesc="TELL ME YOUR PROBLEMS"
url="http://elizagen.org"
arch=('any')
license=('CCPL')
options=(!strip)
depends=('clisp')

source=('https://raw.githubusercontent.com/jeffshrager/elizagen/master/coselleliza1969and1972.lisp')
md5sums=('910d23d6230f7e608a6d2622aecfb1cb')

package() {
    cd "${pkgdir}"
    mkdir -p opt/xyz
    mkdir -p usr/bin

    cd "${srcdir}"
    install -Dvpm644 coselleliza1969and1972.lisp "${pkgdir}"/opt/xyz/eliza.lisp

    cd "${srcdir}"
    printf '#!/bin/sh\n' > eliza
    printf 'cd /opt/xyz\n' >> eliza
    printf 'clisp eliza.lisp' >> eliza

    install -Dvpm755 eliza "${pkgdir}"/usr/bin/eliza
}
