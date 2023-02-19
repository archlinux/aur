# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname='pdd'
pkgname="${_pkgname}-git"
pkgver=r143.9c6a3b7
pkgrel=3
pkgdesc='Tiny date, time diff calculator with piggybacked timers.'
arch=('any')
url='https://github.com/jarun/pdd'
license=('GPL3')
depends=('python' 'python-dateutil')
makedepends=('git' 'python-setuptools')
provides=("pdd")
conflicts=("pdd")
source=("git+${url}.git" 
	"patch-1::${url}/pull/35.patch" 
	"patch-2::${url}/pull/34.patch")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 < "${srcdir}/patch-1"
    patch -p1 < "${srcdir}/patch-2"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
