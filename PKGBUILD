# Maintainer: leaeasy <leaeasy at gmail dot com>
pkgname=hclient-cli
pkgver=1.5.1
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
sha256sums_x86_64=('a0cdebcb652bdae4ba26ff96827c558f368af0673ad910545b4499f9897cfa6c')
sha256sums_aarch64=('348c55c87a4c345ea9c0591eba308e7b286b34096543b1e47e4e2457c5832ede')


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
