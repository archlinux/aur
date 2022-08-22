# Maintainer: Mathieu Deous <mat.deous+aur[at]gmail.com>

pkgname=kalibrate-hackrf-git
_pkgname=kalibrate-hackrf
pkgver=20220321
pkgrel=1
pkgdesc='GSM base stations scanner (for HackRF)'
arch=('i686' 'x86_64')
url='https://github.com/scateu/kalibrate-hackrf'
license=()
depends=('fftw>=3.0')
makedepends=(git gcc make hackrf)
source=("${pkgname}::git+https://github.com/scateu/${_pkgname}")
md5sums=(SKIP)

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
    cd "${srcdir}/${pkgname}"
    ./bootstrap
    ./configure --prefix=/usr
    make ${MAKEFLAGS}
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}/" install
}
