# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-docker-bin
_pkg=nri-docker
pkgver=2.0.1
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
sha256sums_aarch64=('2c81641303ff747e76307ee21814544800a8e9955563138182236e6c4d98e00b')
sha256sums_armv7h=('280f485e6b6a5e7631fd081730186b994d3569f31f69f231388fa1f6760235b4')
sha256sums_x86_64=('e7d0c0d714e2ca4b69fb7ec1edeab3d37f29bccc72430d667bba2712592912e6')
