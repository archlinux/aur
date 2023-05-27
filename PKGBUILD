# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=denaro-git
pkgver=2023.5.0.r6.g4cc5678c
pkgrel=1
pkgdesc='A personal finance manager'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/${pkgname%-git}
license=(GPL3)
depends=('dotnet-runtime>=7' libadwaita)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${pkgname%-git}
	dotnet tool restore
}

build() {
	cd ${pkgname%-git}
	dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
	cd ${pkgname%-git}
	dotnet cake --target=Install --destdir="$pkgdir"
}
