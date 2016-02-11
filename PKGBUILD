# Maintainer: Dries007 <admin@dries007.net>
pkgname=ivona
pkgver=r10.16d6f32
pkgrel=1
pkgdesc="TTS - Text to speech - program that uses the IVONA Speech Cloud HTTP API"
arch=('i686' 'x86_64')
url="https://github.com/dries007/ivona-c"
license=('MIT')
depends=('openssl' 'curl')
provides=('ivona' 'ivona-cached')
install=
changelog=
source=('git+https://github.com/dries007/ivona-c.git')
sha256sums=('SKIP')

build() {
    cd "${srcdir}/ivona-c"
  	cmake .
	cmake --build . --target all
}

pkgver() {
    cd "${srcdir}/ivona-c"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 "${srcdir}/ivona-c/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${srcdir}/ivona-c/ivona" "${pkgdir}/usr/bin/ivona"
    install -Dm755 "${srcdir}/ivona-c/ivona-cached" "${pkgdir}/usr/bin/ivona-cached"
    mkdir -pm777 "${pkgdir}/usr/share/${pkgname}/cache"
}
