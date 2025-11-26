# Maintainer: Soymadip <soumadip@zohomail.in>

pkgname=myctl
pkgdesc="A powerful CLI to control your Linux Desktop"
pkgver=1.1.0
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
    'wireplumber'
)

source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {

    #shellcheck disable=SC2164,SC2154
    cd "${srcdir}" || exit 1

    msg2 "Packaging binaries..."
    for binary in bin/*; do
        #shellcheck disable=SC2154
        install -Dm755 "$binary" "${pkgdir}/usr/bin/$(basename "$binary")"
    done

    msg2 "Packaging libraries..."
    for libfile in lib/*; do
        install -Dm644 "$libfile" "${pkgdir}/usr/lib/myctl/$(basename "$libfile")"
    done

    msg2 "Packaging assets..."
    install -dm755 "${pkgdir}/usr/src/myctl"
    cp -a --no-preserve=ownership src/* "${pkgdir}/usr/src/myctl/"
}
