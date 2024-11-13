# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-mysql-bin
_pkg=${pkgname/-bin/}
pkgver=1.11.0
pkgrel=2
pkgdesc="MySQL integration for New Relic"
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
sha256sums_aarch64=('2cc1ca7bcc162afa1b37bab5e7422a95745fd146b74f88da869fec509857f224')
sha256sums_armv7h=('a78a7f1dd87750a89fd2a22b46d03913cbd38b159e970b638faaccf1de5333d5')
sha256sums_x86_64=('83426428d433c759c60c354af74eb616043128dff89f28a70433f4bd9b6e44bb')

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
