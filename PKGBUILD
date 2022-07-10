# Maintainer: Jose Quintana <joseluisquintana20[at]gmail[dot]com>

pkgname=static-web-server-bin
_pkgname=static-web-server
pkgver=2.10.0
pkgrel=1
pkgdesc="Static Web Server (sws): A blazing fast and asynchronous web server for static files-serving (official binary version)"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://sws.joseluisq.net"
license=('Apache' 'MIT')
provides=('static-web-server' 'sws')
conflicts=('sws')
depends=()
optdepends=()
source_x86_64=(static_web_server_x86_64_${pkgver}.tar.gz::https://github.com/joseluisq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz)
source_i686=(static_web_server_i686_${pkgver}.tar.gz::https://github.com/joseluisq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz)
source_armv6h=(static_web_server_armv6h_${pkgver}.tar.gz::https://github.com/joseluisq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-arm-unknown-linux-musleabihf.tar.gz)
source_armv7h=(static_web_server_armv7h_${pkgver}.tar.gz::https://github.com/joseluisq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-armv7-unknown-linux-musleabihf.tar.gz)
source_aarch64=(static_web_server_aarch64_${pkgver}.tar.gz::https://github.com/joseluisq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz)

sha256sums_x86_64=('20205a7d40d2fad9c9665517937af0ae942e864a0a0f7d925aab89478e0179d4')
sha256sums_i686=('5c06806043c6eecb8043144796d165de81d4a35570dceb31e6c85333845a5346')
sha256sums_armv6h=('0aad2d776b5bc6d94097538713c9d6ca521d7a59348f9a52b09717c6c865c3c1')
sha256sums_armv7h=('27588789bb018fa6f0ab18fea3e4c403d984d7bd8b0a3250d0ac0e956222e197')
sha256sums_aarch64=('3972c627550bb94ee421f88565ad34955a40cd6bab4106bfeeae1ffddbf16a2d')

package() {
    case "$CARCH" in
        'x86_64') target='x86_64-unknown-linux-gnu';;
        'i686') target='i686-unknown-linux-gnu';;
        'armv6h') target='arm-unknown-linux-musleabihf';;
        'armv7h') target='armv7-unknown-linux-musleabihf';;
        'aarch64') target='aarch64-unknown-linux-gnu';;
    esac

    cd "${srcdir}/${_pkgname}-v${pkgver}-${target}/"

    # Install docs
    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"

    cp -R LICENSE-APACHE \
        "${pkgdir}/usr/share/licenses/${_pkgname}/"
    cp -R LICENSE-MIT \
        "${pkgdir}/usr/share/licenses/${_pkgname}/"

    # Install binary
    install -D -m755 ${_pkgname} \
        "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink binary
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/sws"
}
