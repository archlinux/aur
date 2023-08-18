# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=listmonk
pkgname=$_pkgname-bin
pkgver=2.5.1
pkgrel=2
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard (binary release)'
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/knadh/listmonk"
license=('AGPL3')
depends=('postgresql')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=(etc/listmonk/config.toml)
install=$_pkgname.install
source=("$_pkgname-$pkgver.toml::https://raw.githubusercontent.com/knadh/$_pkgname/v$pkgver/config.toml.sample"
        "$_pkgname.conf"
        "$_pkgname.service")
sha256sums=('4941b1bd6d9ebc84b4ee1f9e3cf7aa651484a8bc857864ba40eda7bb67789c18'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '809ede70c932183889b2fa567b340fb82cce1ada76c7b0a0b9efb82b87c92fa0')

source_x86_64=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('552bb7cb47d7b55be7b48a4ccc19d69b96491065433dafd8cc6a0f39869e4113')
sha256sums_aarch64=('832c5a34ed78446c179ed5423cdbce51d3e51333c1ea6cf11c74b63e0776193a')
sha256sums_armv6h=('802a1755071e1a9c8b340984143effe9a88b49216f7711ffa00942535b2c3b76')
sha256sums_armv7h=('7e7e96d64cd2af96711d8d3db717cfdb5c4b8c9ac3fb78b43a4704a8e5625c99')

package() {
  install -Dm644 $_pkgname-$pkgver.toml "$pkgdir/etc/$_pkgname/config.toml"
  install -Dm644 $_pkgname.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 $_pkgname.conf -t "$pkgdir/usr/lib/sysusers.d"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
