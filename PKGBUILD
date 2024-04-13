# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-nginx-bin
_pkg=${pkgname/-bin/}
pkgver=3.4.5
pkgrel=1
pkgdesc="nginx integration for New Relic"
arch=(aarch64 armv7h x86_64)
url="https://github.com/newrelic/${_pkg}"
license=('Apache')
groups=(newrelic)
depends=(newrelic-infra)
provides=( ${_pkg} )
conflicts=( ${_pkg} )
changelog=CHANGELOG
source_aarch64=(https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_arm64.tar.gz)
source_armv7h=(https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_arm.tar.gz)
source_x86_64=(https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_amd64.tar.gz)

package() {
    mkdir -p ${pkgdir}/etc/newrelic-infra/integrations.d
    mkdir -p ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/bin

    install -m u=rw,go=r ${srcdir}/etc/newrelic-infra/integrations.d/nginx-config.yml.sample \
        ${pkgdir}/etc/newrelic-infra/integrations.d/nginx-config.yml
    install -m u=rw,go=r ${srcdir}/var/db/newrelic-infra/newrelic-integrations/nginx-definition.yml \
        ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/
    install -m u=rwx,go=rx ${srcdir}/var/db/newrelic-infra/newrelic-integrations/bin/nri-nginx \
        ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/bin/
}
sha256sums_aarch64=('ca310069b6dd3d803299cead8cb332bcbf9c4367526a533748bba89f39a54ee9')
sha256sums_armv7h=('dbc4999bb11cbccd4faf30471d842646075173237e8a593c98f69561d0d06345')
sha256sums_x86_64=('d378e34a440c71cf4b0d73666d255e7d8c8e123b859521c324c340451b3302bc')
