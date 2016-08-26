pkgname='pipexec'
pkgver=2.5.5
pkgrel=1
pkgdesc='Connector of arbitrary file descriptors'
arch=('i686' 'x86_64')
url="https://github.com/flonatel/pipexec"
license=('GPL2')
source=("https://github.com/flonatel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('d64f3043777c20df026fe44078b81b415f2e5ea6b79ebdd21f82bc663c066177')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -D -m 0644 doc/man/peet.1    "${pkgdir}/usr/share/man/man1/peet.1"
    install -D -m 0644 doc/man/pipexec.1 "${pkgdir}/usr/share/man/man1/pipexec.1"
    install -D -m 0644 doc/man/ptee.1    "${pkgdir}/usr/share/man/man1/ptee.1"
}
