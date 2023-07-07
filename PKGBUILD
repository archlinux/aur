# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=listmonk
pkgname=$_pkgname-bin
pkgver=2.4.0
pkgrel=2
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard'
arch=(x86_64)
url=https://github.com/knadh/listmonk
license=(AGPL3)
depends=(postgresql)
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=(etc/listmonk/config.toml)
install=$_pkgname.install
source=("https://github.com/knadh/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
        "$_pkgname-$pkgver.toml::https://raw.githubusercontent.com/knadh/$_pkgname/v$pkgver/config.toml.sample"
        "$_pkgname.conf"
        "$_pkgname.service")
sha256sums=('acdfd0f4549c15e3cd77a28778ac9904cc54abf3bec98074ee96edc64242971b'
            '4941b1bd6d9ebc84b4ee1f9e3cf7aa651484a8bc857864ba40eda7bb67789c18'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '809ede70c932183889b2fa567b340fb82cce1ada76c7b0a0b9efb82b87c92fa0')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname
  install -Dm644 $_pkgname-$pkgver.toml "$pkgdir/etc/$_pkgname/config.toml"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$_pkgname.service"
  install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "$_pkgname.conf"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
