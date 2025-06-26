# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='garage-bin'
pkgver='1.2.0'
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

sha256sums_x86_64=('bd2a3a7c875bf042a4e14e528bf714071021f94642db29bd3f53dff5947b3c4a')
sha256sums_i686=('2c4ebffaaa734746c318552ac280109f0306ff57d2b8358ed2fd4710b561bb8b')
sha256sums_aarch64=('3be0b307c30e5c29f1b665bd817e023b08ec33cfbd0c3c7eeda8e874c9dbcf89')
sha256sums_armv7h=('17cdd460ddac3ceda0c0eab4f54d59dc0f3a707dd8fb21a9afa451098ff1b7a1')

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
