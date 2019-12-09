# Maintainer: zer0def <zer0def on freenode>
pkgname=libpurple-signald-git
pkgver=0.2.0.r48.40d1ac9
pkgrel=1
pkgdesc='Pidgin libpurple bridge to signald.'
url='https://github.com/hoehermann/libpurple-signald'
license=('GPL3')
arch=('any')
depends=('json-glib' 'libpurple' 'signald')
source=("${pkgname}::git+https://github.com/hoehermann/libpurple-signald")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf '%s.r%s.%s' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 libsignald.so "${pkgdir}/usr/lib/purple-2/libsignald.so"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 icons/16/signal.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/16/signal.png"
    install -Dm644 icons/48/signal.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/48/signal.png"
}
