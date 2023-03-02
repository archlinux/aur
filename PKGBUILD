# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=denaro-git
pkgver=2023.2.2.r31.g98ea94b
pkgrel=1
pkgdesc='A personal finance manager'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/nlogozzo/nickvisionmoney
license=(GPL3)
depends=('dotnet-runtime>=7' libadwaita)
makedepends=(cmake 'dotnet-sdk>=7' git just)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git} nickvision-money)
replaces=(nickvision-money-git)
source=(git+$url)
b2sums=(SKIP)

pkgver() {
	cd nickvisionmoney
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	just nickvisionmoney/NickvisionMoney.GNOME/ publish /usr
}

package() {
	just nickvisionmoney/NickvisionMoney.GNOME/ install "$pkgdir"
}
