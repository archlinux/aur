# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-nginx-bin
_pkg=${pkgname/-bin/}
pkgver=3.4.10
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
sha256sums_aarch64=('ce6f3a389df3b1a615c5b9f685e197a1e6d733fecad45eea0dbd42829bc91eae')
sha256sums_armv7h=('09fdad76a857ee147b95b027b6faf49ed668a50330562367b7e54bf09a6588e4')
sha256sums_x86_64=('ff59a65682d1d9a2a1dbeecb4989a1df8849af63a086935cf0d73d152ad6b457')

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
