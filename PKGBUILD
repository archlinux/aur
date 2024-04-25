# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Andrew Lorimer <andrew@lorimer.id.au>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk-bin
pkgver=3.0.0
pkgrel=1
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard (binary release)'
url="https://github.com/knadh/listmonk"
license=('AGPL-3.0-or-later')
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
depends=('postgresql')
provides=("listmonk")
conflicts=("listmonk" "listmonk-git")
options=(!strip !debug)
backup=(etc/listmonk/config.toml)
install=listmonk.install
source=("listmonk-$pkgver.toml::$url/raw/v$pkgver/config.toml.sample"
        "listmonk.conf"
        "listmonk.service")
sha256sums=('4941b1bd6d9ebc84b4ee1f9e3cf7aa651484a8bc857864ba40eda7bb67789c18'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '4852f206b7763ba047ba123d663cadb806f437967154ebe837845198b3266533')

source_x86_64=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('29c4965146231d40fb9bd2eecb469534a669262c025538788a56d5d365392cf4')
sha256sums_aarch64=('c60a03a1ae74ad96e67eacb205d9b8c3f7dcebff164daa0a1da93e99c361b214')
sha256sums_armv6h=('d70eab28b24d19b22c12d32fafdba56112f39950019aff9d33526e7f44ab7d69')
sha256sums_armv7h=('8f405404901f1283b2ebddf1118f884c72883e981b3b70c2266c1cc523e48794')

package() {
  install -Dm644 listmonk-$pkgver.toml "$pkgdir/etc/listmonk/config.toml"
  install -Dm644 listmonk.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 listmonk.conf -t "$pkgdir/usr/lib/sysusers.d"
  install -Dm755 listmonk -t "$pkgdir/usr/bin"
}
