# Maintainer: <zer0def on freenode>
_reponame=libpurple-signald
pkgname=${_reponame}-git
pkgver=r29.2266145
pkgrel=1
pkgdesc='Pidgin libpurple bridge to signald.'
url='https://github.com/hoehermann/libpurple-signald'
license=('GPL3')
arch=('any')
depends=('json-glib' 'libpurple' 'signald')
source=("${_reponame}::git+https://github.com/hoehermann/libpurple-signald")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_reponame}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_reponame}"
    make
}

package() {
    install -dm755 "${pkgdir}/usr/lib/purple-2/"
    cp --no-preserve=ownership "${srcdir}/${_reponame}/libsignald.so" "${pkgdir}/usr/lib/purple-2/libsignald.so"
}
