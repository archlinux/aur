# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.0
pkgrel=1
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard'
arch=(x86_64)
url=https://listmonk.app
license=(AGPL3)
depends=(postgresql)
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=(etc/listmonk/config.toml)
options=('!strip')
install=$_pkgname.install
source=("https://github.com/knadh/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
		"$_pkgname-$pkgver.toml::https://raw.githubusercontent.com/knadh/$_pkgname/v$pkgver/config.toml.sample"
        "$_pkgname.conf"
        "$_pkgname.service")
sha256sums=('7e8ff7d5e351155142382820b5014451da208c4cc7a5dde9d163cd999287057f'
            'b0fbe305ff7c55328cdc2f0b96bb18e7ea393276a1821bc5fba43f9072474f38'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '809ede70c932183889b2fa567b340fb82cce1ada76c7b0a0b9efb82b87c92fa0')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" $_pkgname
    install -Dm644 $_pkgname-$pkgver.toml "$pkgdir/etc/$_pkgname/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$_pkgname.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "$_pkgname.conf"
}
