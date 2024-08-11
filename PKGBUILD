# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-docker-bin
_pkg=nri-docker
pkgver=2.0.7
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
sha256sums_aarch64=('9d2a92ac9e0463be6eb5fc8251e26d3f08477669574bf166e8d69e8ef7cb1253')
sha256sums_armv7h=('ec862466fe897dc81b84737807a90b110d6a7545b8b1b9ef5c6247754a84fe82')
sha256sums_x86_64=('4d323fd35042311031d03a4f1186d24b941e6e42d4ad79ea9f827ce356d5a50f')
