# Maintainer: Richard Lees <git zero at bitservices dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Nils Czernia <nils@czserver.de>
################################################################################

_name=prometheus-push-gateway

################################################################################

pkgname="${_name}-bin"
pkgver=1.11.2
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
sha256sums_x86_64=('2ec72315e150dda071fdeef09360780a386a67e5207ebaa53bb18f2f1a3b89cf')
sha256sums_arm=('907e95534017010583a7bf48f98a11e403eaed679e6f4f36b045c454b48b6ea0')
sha256sums_armv6h=('9a298bf5027c2479080cf09a36613fe81af93f0abe0345ef42d57691d9ade3f5')
sha256sums_armv7h=('3f95bad8a40edf34e3602d18323f07ef92d3d5b7a141b1145c5e6dbfce7cd7ce')
sha256sums_aarch64=('b3fb835dbb0a29b1d6f9cd7ae3568a5615e59b96f8787965248cea67163d4db1')

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
