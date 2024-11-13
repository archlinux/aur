# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-docker-bin
_pkg=nri-docker
pkgver=2.1.0
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
sha256sums_aarch64=('8f02c11b9ab380440843d469b233d6405ad715b9c000ca3b30f1e1dab964b21d')
sha256sums_armv7h=('399f04438cffb8f32f2dbe0d140029daada32ef8123dd46657d97bccae831863')
sha256sums_x86_64=('9b3b28cdc62abdb3d9aac274bd974e9d564a5cca6333a44a386c71d489e9d9ba')

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
