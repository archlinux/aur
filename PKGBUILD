# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-mysql-bin
_pkg=${pkgname/-bin/}
pkgver=1.10.8
pkgrel=1
pkgdesc="MySQL integration for New Relic"
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

    install -m u=rw,go=r ${srcdir}/etc/newrelic-infra/integrations.d/mysql-config.yml.sample \
        ${pkgdir}/etc/newrelic-infra/integrations.d/mysql-config.yml
    install -m u=rw,go=r ${srcdir}/var/db/newrelic-infra/newrelic-integrations/mysql-definition.yml \
        ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/
    install -m u=rwx,go=rx ${srcdir}/var/db/newrelic-infra/newrelic-integrations/bin/nri-mysql \
        ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/bin/
}
sha256sums_aarch64=('048c484a4be74ec1e20b5e6bbeaf40e57a7d7e8a8007affa4f00b7634ea20b3a')
sha256sums_armv7h=('c7ef9d94cee317260f693bb57941b827d263196e86662de33388a87353c5ef23')
sha256sums_x86_64=('6df72f15ecc53ccb89ef2c611fb4dc302a02dc688b9a38577f1149c40b3332da')
