# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-mysql-bin
_pkg=${pkgname/-bin/}
pkgver=1.10.9
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
sha256sums_aarch64=('6d284aad5ca21ce07a4b28932863750439ae3ad9270b6ea2085e11a0370a2936')
sha256sums_armv7h=('920f29025743c5e23756d09c717b6e5e7ffc9ac23a301795e52a2fe3e8b40005')
sha256sums_x86_64=('e71ab6ea15ffb4db1960645dd3ecffdf86aee1d853ff447293f948dd5d3d69f7')
