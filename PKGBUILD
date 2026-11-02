# Maintainer: Dan Clemente <danilonc (at) bugnotfound (dot) com>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

_name=hcxlabtool
pkgname="${_name}-git"
pkgver=r632.7f2218a
pkgrel=2
pkgdesc='Experimental tool for testing hcxdumptool updates'
arch=('x86_64')
url='https://github.com/ZerBea/wifi_laboratory'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${_name}"
    make
}

package() {
    cd "${srcdir}/${_name}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
