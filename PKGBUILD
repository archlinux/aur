# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=cstatus
pkgver=1.1.0
pkgrel=1
pkgdesc='statusbar for dwm written in C99.'
arch=('x86_64')
url='https://git.sr.ht/~andreafeletto/cstatus'
license=('MIT')
depends=('libx11' 'alsa-lib')
provides=('cstatus')
conflicts=('cstatus-git')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~andreafeletto/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c4bab6e65c151288b1eed56836f6d5b1173abb5fc4543cdb8e8b720dc93fb5b0')

cflags="-Os -flto -march=native -mtune=native"
ldflags="${cflags} -lm -lX11 -lasound"

build () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make all CFLAGS="${cflags}" LDFLAGS="${ldflags}"
}

package () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
