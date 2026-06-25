# Maintainer: Richard Lees <git zero at bitservices dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Nils Czernia <nils@czserver.de>
################################################################################

_name=prometheus-push-gateway

################################################################################

pkgname="${_name}-bin"
pkgver=1.11.3
pkgrel=1
pkgdesc='Prometheus push acceptor for ephemeral and batch jobs'
arch=('x86_64'
      'arm'
      'armv6h'
      'armv7h'
      'aarch64')
url='https://github.com/prometheus/pushgateway'
license=('Apache')
source=("${_name}.conf"
        "${_name}.service"
        "${_name}.sysusers")
source_x86_64=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-amd64.tar.gz")
source_arm=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv5.tar.gz")
source_armv6h=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-arm64.tar.gz")

sha256sums=('be9f4e2f79402e681c0cd3c4b29be0a409f77a46d343467c3fbd13984222f5ef'
            '8b13f20a2c51bc08d0f5ce00145dcd0c15e4251709a0d4036315e9ef9794fa18'
            '40f36f2a5c81c1fee899bd01d5610a2ecccb06ddb12b0a9585f1795acd397b50')
sha256sums_x86_64=('bb0a44dee0953df9e8cd3c082981ff50327de56d965d83bdd9b0957d83921e38')
sha256sums_arm=('762a5bbd5a897bd45623789559fcf81f990ee309c852206d97a68f6de3460b0e')
sha256sums_armv6h=('cd4fadf1dbff52a7055aefc606a9aad82b55245d2daca95876713a051b203d44')
sha256sums_armv7h=('38e10f4132e255fa5ef99b9bded8d7967d0831e0fa7a3d262e39cbbced37f35b')
sha256sums_aarch64=('727ff0098943657b44c21a029be9d9fcc4f249ec72dcb9f0a34aa66b2d5f1ecc')

################################################################################

package() {
    case "$CARCH" in
        "x86_64") ARCH="amd64";;
        "arm") ARCH="armv5";;
        "armv6h") ARCH="armv6";;
        "armv7h") ARCH="armv7";;
        "aarch64") ARCH="arm64";;
    esac

    install -Dm755 "${srcdir}/pushgateway-${pkgver}.linux-${ARCH}/pushgateway" "${pkgdir}/usr/bin/${_name}"
    install -Dm644 "${srcdir}/${_name}.conf" "${pkgdir}/etc/conf.d/${_name}"
    install -Dm644 "${srcdir}/${_name}.service" "${pkgdir}/usr/lib/systemd/system/${_name}.service"
    install -Dm644 "${srcdir}/${_name}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_name}.conf"
}

################################################################################
