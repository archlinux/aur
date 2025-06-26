# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='garage-bin'
pkgver='2.0.0'
pkgrel='1'
pkgdesc='Garage, an S3-compatible distributed object store for self-hosted deployments. Pre-compiled.'
url="https://garagehq.deuxfleurs.fr"
license=('AGPL-3.0-only')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
depends=('zstd' 'lmdb')
provides=('garage')
conflicts=('garage')

source_x86_64=("${url}/_releases/v${pkgver}/x86_64-unknown-linux-musl/garage")
source_i686=("${url}/_releases/v${pkgver}/i686-unknown-linux-musl/garage")
source_aarch64=("${url}/_releases/v${pkgver}/aarch64-unknown-linux-musl/garage")
source_armv7h=("${url}/_releases/v${pkgver}/armv6l-unknown-linux-musleabihf/garage")

sha256sums_x86_64=('8f6ea413ddf7e6cba40d4defd51b7bc38bc32d8b4579eaa510e63b112d116c73')
sha256sums_i686=('231356d3787a6e7ef3048d0cb5989fc75942bacb2991a287dd93752670271551')
sha256sums_aarch64=('07c37b89cba6ead330dfafc2fc72d00308dcde75fb5922f161585037417c57ee')
sha256sums_armv7h=('a426b10510812c03ebdc060f5c3bba4e381277e031c8b98362bea1e7a2a6b591')

source=("garage.toml.example"
        "garage.service"
        "garage.sysusers")
sha256sums=('f7a1afb502f01c87fddb06f362cf66dc26df8759ee9c9c08edaf442cd4b2264d'
            'a0fc4371f47bdf0796c7827ef2696092844cb6f8a4d22cedd23d899dd79e8e03'
            'bd98219da5b6476f12d5f0f872c68f23492ecfd97dfd3fe68c3bc526f2b9f747')

package() {
  install -Dm775 "${srcdir}/garage" "${pkgdir}/usr/bin/garage"
  install -Dm644 "${srcdir}/garage.toml.example" "${pkgdir}/etc/garage.toml.example"
  install -Dm644 "${srcdir}/garage.service" "${pkgdir}/usr/lib/systemd/system/garage.service"
  install -Dm644 "${srcdir}/garage.sysusers" "${pkgdir}/usr/lib/sysusers.d/garage.conf"
}
