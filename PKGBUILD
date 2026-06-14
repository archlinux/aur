# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname="ddnss"
pkgver=0.1.0
pkgrel=1
pkgdesc='Update DynDNS hosts registered at ddnss.de'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('MIT')
options=(!lto)
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}")
md5sums=('f4cd94c0bb01367f7954f96bc14db5f8')

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

    mkdir -p "/usr/lib/systemd/system"
    install "ddnss.service" "/usr/lib/systemd/system"
    install "ddnss.timer" "/usr/lib/systemd/system"

    mkdir -p "/usr/lib/sysusers.d"
    install "ddnss.conf" "/usr/lib/sysusers.d"
}
