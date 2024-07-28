# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='garage-bin'
pkgver='1.0.0'
pkgrel='2'
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

sha256sums_x86_64=('2bd72c49961c84139175b4fb47bdd349e324006d78854b90e8d1040e0d07927b')
sha256sums_i686=('d10eeabf06a8884e0f06a25a3e0995642a27e8a3597f5c129c001748fa33ad92')
sha256sums_aarch64=('64dce2913ca65aafa90ea7aa9f1d7ac3b65f7ba5e642ff3d744ca710f2cd6f87')
sha256sums_armv7h=('ad3dd17b594d5ed5f21105c3c30f9e7e4a0ab825ed758df6a0d0fd27237a02e7')

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
