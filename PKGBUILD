# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-mysql-bin
_pkg=${pkgname/-bin/}
pkgver=1.10.5
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
sha256sums_x86_64=('2e99b6c55270a4c2fbe2728721052612132e27bb236939f2f5ad29d7e094df14')

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
sha256sums_aarch64=('fc6edd90edeb8ea215aa2d26310097cd2dafab055e640bc95b15b6b6feabbb0f')
sha256sums_armv7h=('c7f77a78cd9664392244f0faa13d350300e589cfe3d84ce2fe960e5bbcb58aa1')
sha256sums_x86_64=('e8aaf1810860f99605d9b1ee3151c8fae9bb8d6dd4123f9f31f4a570f0efa02f')
