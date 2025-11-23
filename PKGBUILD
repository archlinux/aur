# Maintainer: Soymadip <soumadip@zohomail.in>

pkgname=myctl
pkgdesc="A powerful CLI to control your Linux Desktop"
pkgver=1.0.4
pkgrel=1
arch=('any')
url="https://github.com/mydehq/${pkgname}"
license=('GPL3')
sha256sums=('SKIP')

depends=(
    'bash'
    'gawk'
    'sed'
    'grep'
    'rofi'
    'wob'
)

source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {
    cd "${srcdir}"

    msg2 "Installing binaries..."
    for binary in bin/*; do
        install -Dm755 "$binary" "${pkgdir}/usr/bin/$(basename "$binary")"
    done

    msg2 "Installing libraries..."
    for libfile in lib/*; do
        install -Dm644 "$libfile" "${pkgdir}/usr/lib/myctl/$(basename "$libfile")"
    done

    msg2 "Installing assets..."
    install -dm755 "${pkgdir}/usr/share/myctl"
    cp -a --no-preserve=ownership src/* "${pkgdir}/usr/share/myctl/"
}
