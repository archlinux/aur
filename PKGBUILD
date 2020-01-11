# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=eschalot-git
pkgver=r31.a45bad5
pkgrel=1
pkgdesc='A Tor hidden service name generator'
license=('custom')
arch=('any')
url="https://github.com/ReclaimYourPrivacy/eschalot"
depends=('openssl')
makedepends=('git') 
provides=('eschalot')
conflicts=('eschalot')
changelog=CHANGELOG
source=("${pkgname}"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}


build() {
    cd "${srcdir}/${pkgname}"
    make
}


package() {
    install -Dm755 "${srcdir}/${pkgname}/eschalot" "${pkgdir}/usr/bin/eschalot"
    install -Dm755 "${srcdir}/${pkgname}/worgen" "${pkgdir}/usr/bin/worgen"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
