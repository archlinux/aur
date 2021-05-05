# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk-bin
_pkgname=${pkgname%-bin}
pkgver=0.9.0
pkgrel=6
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard'
arch=(x86_64)
url=https://listmonk.app
license=(AGPL3)
depends=(postgresql)
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=(etc/listmonk/config.toml)
install=$_pkgname.install
source=("https://github.com/knadh/$_pkgname/releases/download/v$pkgver-beta/${_pkgname}_$pkgver-beta_linux_amd64.tar.gz"
        "$_pkgname.conf"
        "$_pkgname.service"
        "$_pkgname.toml")
sha256sums=('1137f572fd93b25034865cb638d169acb1bd9b87d6848c274405bc6108dad62c'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '809ede70c932183889b2fa567b340fb82cce1ada76c7b0a0b9efb82b87c92fa0'
            '6c72c0adbcd80dabcb5bcde6ddf01e3da9e2f2503eef52362497b0c0e76f8209')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" $_pkgname
    install -Dm644 "$_pkgname.toml" "$pkgdir/etc/$_pkgname/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$_pkgname.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "$_pkgname.conf"
}
