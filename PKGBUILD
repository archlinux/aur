# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-docker-bin
_pkg=nri-docker
pkgver=2.0.4
pkgrel=1
pkgdesc="Docker integration for New Relic"
arch=(aarch64 armv7h x86_64)
url="https://github.com/newrelic/${_pkg}"
license=('Apache')
groups=(newrelic)
depends=(newrelic-infra)
provides=( ${_pkg} )
conflicts=( ${_pkg} )
changelog=CHANGELOG
source_aarch64=(https://github.com/newrelic/nri-docker/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_arm64.tar.gz)
source_armv7h=(https://github.com/newrelic/nri-docker/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_arm.tar.gz)
source_x86_64=(https://github.com/newrelic/nri-docker/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_amd64.tar.gz)

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
sha256sums_aarch64=('811146e0fb89d0dc324f87f2a5a472f8b2d05ea4aaf90a531c97c9257bec57df')
sha256sums_armv7h=('ef264f69f13b9072cf4dc7143ba8238ce038f1544e7cff88966cb309f9c27600')
sha256sums_x86_64=('2e7e0dd41559ba3522c86bbfa2f74e92091a50390c55cb5bd11339186a39cb83')
