# Maintainer: Jose Quintana <joseluisquintana20[at]gmail[dot]com>

pkgname=static-web-server-bin
_pkgname=static-web-server
pkgver=2.5.0
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
# source_armv6h=(static_web_server_armv6h_${pkgver}.tar.gz::https://github.com/joseluisq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-arm-unknown-linux-musleabihf.tar.gz)
# source_armv7h=(static_web_server_armv7h_${pkgver}.tar.gz::https://github.com/joseluisq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-armv7-unknown-linux-musleabihf.tar.gz)
source_aarch64=(static_web_server_aarch64_${pkgver}.tar.gz::https://github.com/joseluisq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz)

sha256sums_x86_64=('685f33314584407c8055f96c067a2f4d2b0b71680ff432c2baa0e2916f9b47dd')
sha256sums_i686=('7a5a38ef0bfc5d1e034b3429d18ccad53dfc39ac0caf7e71d620103a9362c075')
# sha256sums_armv6h=('')
# sha256sums_armv7h=('')
sha256sums_aarch64=('1501d0a8ed5d9ae9d09f85ac143c8c72a856dfd82449f68bde4b74397b7b7a50')

package() {
    case "$CARCH" in
        'x86_64') target='x86_64-unknown-linux-gnu';;
        'i686') target='i686-unknown-linux-gnu';;
        'armv6h') target='arm-unknown-linux-musleabihf';;
        'armv7h') target='arm7-unknown-linux-musleabihf';;
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
