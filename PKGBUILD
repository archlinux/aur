# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='garage-bin'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Garage, an S3-compatible distributed object store for self-hosted deployments. Pre-compiled.'
url="https://garagehq.deuxfleurs.fr"
arch=('x86_64')
depends=('zstd' 'lmdb')
license=('GPL')
provides=('garage-bin')
conflicts=('garage')
source=("${url}/_releases/v1.0.0/x86_64-unknown-linux-musl/garage"
        "${pkgname/-bin/}.toml.example"
        "${pkgname/-bin/}.service"
        "${pkgname/-bin/}.sysusers")
sha256sums=('2bd72c49961c84139175b4fb47bdd349e324006d78854b90e8d1040e0d07927b'
            'f7a1afb502f01c87fddb06f362cf66dc26df8759ee9c9c08edaf442cd4b2264d'
            'a0fc4371f47bdf0796c7827ef2696092844cb6f8a4d22cedd23d899dd79e8e03'
            'bd98219da5b6476f12d5f0f872c68f23492ecfd97dfd3fe68c3bc526f2b9f747')

package() {
  install -Dm775 "${srcdir}/garage" "${pkgdir}/usr/bin/garage"
  install -Dm644 "${srcdir}/garage.toml.example" "${pkgdir}/etc/garage.toml.example"
  install -Dm644 "${srcdir}/garage.service" "${pkgdir}/usr/lib/systemd/system/garage.service"
  install -Dm0644 "${srcdir}/garage.sysusers" "${pkgdir}/usr/lib/sysusers.d/garage.conf"
}
