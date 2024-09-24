# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='garage-bin'
pkgver='1.0.1'
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

sha256sums_x86_64=('3444d69063a91a1b4fb771a47f056db53c44f51d51e4eb58fb357fe62fe26f26')
sha256sums_i686=('59f4821a7291b9556f03158dea3cfccbff57f011e654cdf3f164be38ada2a2ce')
sha256sums_aarch64=('768e3adb246e408c7bd8b9c092f2e3563c28c6c9c63acfb4c7b638eae25bea7a')
sha256sums_armv7h=('13ce750073b887d24ae0eeb4011420c6f78455595622fb7af0e448582a391864')

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
