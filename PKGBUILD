# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-docker-bin
_pkg=nri-docker
pkgver=2.2.0
pkgrel=2
pkgdesc="Docker integration for New Relic"
arch=(aarch64 armv7h x86_64)
url="https://github.com/newrelic/${_pkg}"
license=('Apache')
groups=(newrelic)
depends=(newrelic-infra)
provides=( ${_pkg} )
conflicts=( ${_pkg} )
#changelog=CHANGELOG
source_aarch64=(https://github.com/newrelic/nri-docker/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_arm64.tar.gz)
source_armv7h=(https://github.com/newrelic/nri-docker/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_arm.tar.gz)
source_x86_64=(https://github.com/newrelic/nri-docker/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_amd64.tar.gz)
sha256sums_aarch64=('33e2b0fb148a0bea8280a31cf52fe5c451b819f8159b896701d8fc10c8f0419d')
sha256sums_armv7h=('084f87ebb1ca77d35b44f27722d49b8fb753c38eebcbb90167c4bb35360114b6')
sha256sums_x86_64=('448d14907e05e9ab3525da3c12b3aa7e9ee9ed3cc492714fa0bcd0e6af1b2bc2')

package() {
    mkdir -p ${pkgdir}/etc/newrelic-infra/integrations.d
    mkdir -p ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/bin

    install -m u=rw,go=r ${srcdir}/etc/newrelic-infra/integrations.d/docker-config.yml \
        ${pkgdir}/etc/newrelic-infra/integrations.d/
    install -m u=rw,go=r ${srcdir}/var/db/newrelic-infra/newrelic-integrations/docker-definition.yml \
        ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/
    install -m u=rwx,go=rx ${srcdir}/var/db/newrelic-infra/newrelic-integrations/bin/nri-docker \
        ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/bin/
}
