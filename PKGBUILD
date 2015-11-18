# Maintainer: Tarmo Heiskanen <turskii@gmail.com>
pkgname=edbg-git
pkgver=r24
pkgrel=1
pkgdesc='Atmel EDBG programmer'
url='https://github.com/ataradov/edbg'
arch=('i686' 'x86_64')
license=('BSD')
source=('git+https://github.com/ataradov/edbg.git')
md5sums=('SKIP')
makedepends=('git')
provides=('edbg')
conflicts=('edbg')

pkgver() {
    cd "edbg"
    printf r$(git rev-list --count HEAD)
}

build() {
    cd "${srcdir}/edbg"
    make
}

package() {
    cd "${srcdir}/edbg"
    install -m755 -D ./edbg "$pkgdir/usr/bin/edbg"
    install -m644 -D ./90-atmel-edbg.rules "$pkgdir/usr/lib/udev/rules.d/90-atmel-edbg.rules"
}
