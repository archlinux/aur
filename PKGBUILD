# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='garage-bin'
pkgver='1.1.0'
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

sha256sums_x86_64=('b21a39ea5845193deed95187d1ed5598ac50ea63f60f678a20ed786fda0db70d')
sha256sums_i686=('f88d650287107c1812ef050a5b389efb8295b1b31026b760b8df20efdc6ccbfc')
sha256sums_aarch64=('9ceb52e3c5f14b75db0f0d4958c7f31cd5738fe62e320dbb233608ce9e78f2c6')
sha256sums_armv7h=('18bb74f9d47ca6f42dbc97c32fb130f41abcfb765d3e79d99e0a672f7cb8ca0d')

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
