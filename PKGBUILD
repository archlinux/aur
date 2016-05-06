# Maintainer: Andres Perez <andres.f.perez at gmail dot com>

pkgname=xkev-git
_pkgname=xkev
epoch=1
pkgver=20160222.54fc638
pkgrel=1
pkgdesc='Simply simulate KeyPress/KeyRelease'
url='http://github.com/vlaadbrain/xkev'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
source=('git://github.com/vlaadbrain/xkev.git')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
