# Maintainer: leaeasy <leaeasy at gmail dot com>
pkgname=hclient-cli
pkgver=1.1.3
pkgrel=1
pkgdesc="懒猫微服客户端 Lazy Cat microservice desktop client (cli version)"
url='https://lazycat.cloud/download'
license=('LicenseRef-lazycat-license')
arch=('x86_64' 'aarch64')

depends=(
)

install=hclient-cli.install
options=(!strip !debug emptydirs)

_url_prefix="https://dl.lazycatmicroserver.com/hclient-cli"
source=("hclient-cli.service")
source_x86_64=("hclient-cli-linux-amd64::${_url_prefix}/v${pkgver}/hclient-cli-linux-amd64")
source_aarch64=("hclient-cli-linux-arm64::${_url_prefix}/v${pkgver}/hclient-cli-linux-arm64")

sha256sums=('7a80d01c8a86cbedf7fe0fe7adcc9a039dab719f83251d20e117e75c7deb3531')
sha256sums_x86_64=('77bfdc49f3abfffd1b1c1cb8ea1962a80680a3dcdf9c360a8f103d640c34d84e')
sha256sums_aarch64=('b0bbb299e1b799bc74811562234e0ae93d97b8ff12f5091b1dc5fbc66c4d8963')


package() {
    local _bin

    case "${CARCH}" in
        x86_64) _bin='hclient-cli-linux-amd64' ;;
        aarch64) _bin='hclient-cli-linux-arm64' ;;
        *) return 1 ;;
    esac

    install -Dm755 "${_bin}" "${pkgdir}/usr/bin/hclient-cli"
    install -Dm644 hclient-cli.service "${pkgdir}/usr/lib/systemd/user/hclient-cli.service"
}
