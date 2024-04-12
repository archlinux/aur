# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=newrelic-fluent-bit-output-bin
_pkg=${pkgname//-bin/}
pkgver=1.17.3
pkgrel=1
pkgdesc="Fluent Bit output plugin that sends data to New Relic"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/newrelic/newrelic-fluent-bit-output"
license=('Apache')
groups=('newrelic')
provides=('newrelic-fluent-bit-output')
conflicts=('newrelic-fluent-bit-output')
backup=('var/db/newrelic-infra/newrelic-integrations/logging/parsers.conf')

source=('https://github.com/newrelic/fluent-bit-package/blob/main/parsers.conf')
sha256sums=('c8a156912ca433cdddb38feb5fd1dd1ca21e53fce0ad0ccfc40ad0e32ca14cc3')

source_aarch64=("out_newrelic_aarch64.so::https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/out_newrelic-linux-arm64-${pkgver}.so")
sha256sums_aarch64=('3dc3f43496ae926be39ef19f570646d83a302133f58ff35b427dbc68bd3a0237')

source_armv7h=("out_newrelic_armv7h.so::https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/out_newrelic-linux-arm-${pkgver}.so")
sha256sums_armv7h=('eca4be41f9fe6e18027790ad1bd32f87d81b2f8a0b26467e6359f6bff90f02f3')

source_x86_64=("out_newrelic_x86_64.so::https://github.com/newrelic/${_pkg}/releases/download/v${pkgver}/out_newrelic-linux-amd64-${pkgver}.so")
sha256sums_x86_64=('c7c1b1a812dd9688e4b03b1cb8e31e3fb355dd89563ea55471529b8e7876c177')

noextract=( 
            'parsers.conf'
            'out_newrelic_aarch64.so'
            'out_newrelic_armv7h.so'
            'out_newrelic_x86_64.so'
          )

package() {
    mkdir -p ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/logging/
    install -m u=rw,go=r -o root -g root ${srcdir}/out_newrelic_${CARCH}.so \
        ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/logging/out_newrelic.so
    install -m u=rw,go=r -o root -g root ${srcdir}/parsers.conf \
        ${pkgdir}/var/db/newrelic-infra/newrelic-integrations/logging/
}
