# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname="ddnss"
pkgver=0.2.0
pkgrel=1
pkgdesc='Update DynDNS hosts registered at ddnss.de'
arch=('x86_64')
url="https://github.com/coNQP/${pkgname}"
license=('MIT')
makedepends=('cargo' 'git')
options=(!lto)
source=("${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}")
md5sums=('167130f057357b0bcce071bc4c6be850')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/usr/bin"
    install "target/release/${pkgname}" "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install "ddnss.service" "${pkgdir}/usr/lib/systemd/system"
    install "ddnss.timer" "${pkgdir}/usr/lib/systemd/system"

    mkdir -p "${pkgdir}/usr/lib/sysusers.d"
    install "ddnss.conf" "${pkgdir}/usr/lib/sysusers.d"
}
