# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-nginx-bin
_pkg=${pkgname/-bin/}
pkgver=3.5.1
pkgrel=1
pkgdesc="nginx integration for New Relic"
arch=(aarch64 armv7h x86_64)
url="https://github.com/newrelic/${_pkg}"
license=('Apache')
groups=(newrelic)
depends=(newrelic-infra)
provides=( ${_pkg} )
conflicts=( ${_pkg} )
#changelog=CHANGELOG
source_aarch64=(https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_arm64.tar.gz)
source_armv7h=(https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_arm.tar.gz)
source_x86_64=(https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/${_pkg}_linux_${pkgver}_amd64.tar.gz)
sha256sums_aarch64=('0511c9a1208381ab7db319fd41fb47ef6667587fa17a5a474ccde3613cf60de7')
sha256sums_armv7h=('83d5a4c2eb1a4023291ce129a92986306017e61ca111d91dc1a5cb80d338749c')
sha256sums_x86_64=('195836821f5b6367390dfc3c833de27d299cf0e3b336a2fdaec711e14c9122e6')

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
