# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=denaro-git
pkgver=2023.4.0.r50.g08d65ef
pkgrel=1
pkgdesc='A personal finance manager'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/${pkgname%-git}
license=(GPL3)
depends=('dotnet-runtime>=7' libadwaita)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git just)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	just ${pkgname%-git}/NickvisionMoney.GNOME/ publish /usr
}

package() {
	just ${pkgname%-git}/NickvisionMoney.GNOME/ install "$pkgdir"
}
