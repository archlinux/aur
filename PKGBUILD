# Maintainer: Jonathan <greenbigfrog@gmail.com>
_pkgname=okcash
pkgname=okcashd-git
pkgver=r175.f1d2218
pkgrel=1
pkgdesc="Okcash daemon, git version"
arch=('i686' 'x86_64')
url="http://okcash.co"
license=('MIT')
makedepends=('git' 'boost')
depends=('boost-libs' 'openssl')
provides=('okcashd')
conflicts=('okcashd')
source=('git+https://github.com/okcashpro/okcash.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/src"
    make -f makefile.unix USE_UPNP=-
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "src/okcashd" "${pkgdir}/usr/bin/okcashd"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/okcashd/LICENSE"
    install -d "${pkgdir}/usr/share/doc/okcashd"
    cp -a "doc/" "${pkgdir}/usr/share/doc/okcashd/"
}
