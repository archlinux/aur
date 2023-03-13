# Maintainer: Jose Quintana <joseluisquintana20[at]gmail[dot]com>

pkgname=static-web-server-bin
_pkgname=static-web-server
pkgver=2.15.0
pkgrel=1
pkgdesc="Static Web Server (sws): A cross-platform, high-performance and asynchronous web server for static files-serving (official binary version)"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://sws.joseluisq.net"
license=('Apache' 'MIT')
provides=('static-web-server' 'sws')
conflicts=('sws')
depends=()
optdepends=()
source_x86_64=(static_web_server_x86_64_${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz)
source_i686=(static_web_server_i686_${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz)
source_armv6h=(static_web_server_armv6h_${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-arm-unknown-linux-musleabihf.tar.gz)
source_armv7h=(static_web_server_armv7h_${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-armv7-unknown-linux-musleabihf.tar.gz)
source_aarch64=(static_web_server_aarch64_${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz)

sha256sums_x86_64=('8137b81713528a6a6de6600613e7317256670608b0faf9a3601e0560e55cc046')
sha256sums_i686=('ad723df8c33b5eb4cbdfdeb7cc1ba12ac9d15fa0173fde5151154c1a7a721486')
sha256sums_armv6h=('08089b209b59d734671f978e28cd21790202b7b4c325365f0a95489682cc9d7d')
sha256sums_armv7h=('2990e8e8150ebccc20451ef81412925c1efcbbc27e9769fc4011db127aa812de')
sha256sums_aarch64=('e5eb5ceb45298a9b456447849afc81c3aeacb7d2602c25df4fd7091d8fafa90c')

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
