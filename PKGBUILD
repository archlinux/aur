# Maintainer: Richard Lees <git zero at bitservices dot io>
###############################################################################

_exporter=squid-exporter

###############################################################################

pkgname="prometheus-${_exporter}"
pkgver=1.13.0
pkgrel=1
pkgdesc='Exports squid metrics in Prometheus format'
arch=('x86_64'
      'armv6h'
      'armv7h'
      'aarch64')
url="https://github.com/boynux/${_exporter}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('SKIP'
            '53b089247a51e0648987186c1045bf0412a41110057b57d3627296384e571725'
            '5c358eb7c4b5c88b5861962dd5c717323e9366490f81a3856e391f09173b220d'
            'c450176d8fd046e2cd5776df358a894a3b76ca6e50393ff0e20d62bbb27b7a0f')

###############################################################################

build() {
  cd "${_exporter}-${pkgver}"

  export GOFLAGS="-trimpath"
  go build -o "${pkgname}"
}

###############################################################################

package() {
    install -Dm755 "${_exporter}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

###############################################################################
