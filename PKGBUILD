# Maintainer: E5ten <e5ten.arch@gmail.com>

_pkgname='tinyalsa'
pkgname="${_pkgname}-git"
pkgver=0.0
pkgrel=1
pkgdesc='a small library to interface with ALSA in the Linux kernel'
arch=('x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('custom')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('tinyalsa')
conflicts=('tinyalsa')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cmake -S "${srcdir}/${_pkgname}" -B "${srcdir}/build" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='Release' \
        -DTINYALSA_USES_PLUGINS='ON'
    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    install -Dm644 "${srcdir}/${_pkgname}/NOTICE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
