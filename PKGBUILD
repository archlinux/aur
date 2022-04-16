# Maintainer: Jose Quintana <joseluisquintana20[at]gmail[dot]com>

pkgname=static-web-server-bin
_pkgname=static-web-server
pkgver=2.7.1
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

sha256sums_x86_64=('4e0555bd4b637cf6e62a5253f6102cd6f3f59ef3c79751c8a0d98c55861255bb')
sha256sums_i686=('4130ac2370b674e7f661e3828f00e32aa82e9da8f624aae7572b96ae58dda29b')
sha256sums_armv6h=('6d6a9d7204973a3699b5dbcbf5847985b298de5a980ba5546135907ee93e81cf')
sha256sums_armv7h=('f72c092fda8f6292bc56d185a43bf75efb920af8e9b1b1b2c701e040a6ccd588')
sha256sums_aarch64=('d00028988b42fb0557113b935482066df63574fcb5f49e7df6a1fc0acf32de50')

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
