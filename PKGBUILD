# Maintainer: database64128 <free122448@hotmail.com>

pkgname=ddns-cloudflare-powershell-git
pkgver=r8.4caef0a
pkgrel=1
pkgdesc="A simple Powershell script for DDNS with Cloudflare API"
arch=(x86_64)
url="https://github.com/database64128/ddns-cloudflare-powershell"
license=('GPL3')
depends=('powershell')
makedepends=('git')
provides=("ddns-cloudflare-powershell")
conflicts=("ddns-cloudflare-powershell")
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $pkgname
    install -Dm755 ddns-cloudflare.ps1 $pkgdir/usr/bin/ddns-cloudflare-powershell
    install -Dm644 systemd/ddns-cloudflare-powershell.service $pkgdir/usr/lib/systemd/system/ddns-cloudflare-powershell.service
    install -d $pkgdir/etc/ddns-cloudflare-powershell
    install -Dm644 settings.jsonc.example $pkgdir/etc/ddns-cloudflare-powershell/settings.jsonc
}
