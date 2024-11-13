# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=nri-nginx-bin
_pkg=${pkgname/-bin/}
pkgver=3.5.0
pkgrel=2
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
sha256sums_aarch64=('ec8c129398eaa8a9a7c06a0581f61ac7d63f3a2fcbafc1ad359b893320ef9466')
sha256sums_armv7h=('4e6d691bea5de5664ee69324b8de3875197080c34098de3ea5366a6f77a25739')
sha256sums_x86_64=('bcdeef3a20be618f1a8ffe886df294ee9d21c43b99b905f876d7a78d1affcd78')

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
