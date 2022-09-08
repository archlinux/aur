# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname='pdd'
pkgname="${_pkgname}-git"
pkgver=r132.4de93e9
pkgrel=1
pkgdesc='Tiny date, time diff calculator with piggybacked timers.'
arch=('any')
url='https://github.com/jarun/pdd'
license=('GPL3')
depends=('python' 'python-dateutil')
makedepends=('git' 'python-setuptools')
provides=("pdd")
conflicts=("pdd")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    gzip -c -9 "${_pkgname}".1 > "${_pkgname}".1.gz
    install -Dm644 "${_pkgname}".1 "${pkgdir}/usr/share/man/man1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
