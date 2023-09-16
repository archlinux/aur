# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=denaro
pkgver=2023.9.2
pkgrel=1
pkgdesc="A personal finance manager"
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/$pkgname
license=(GPL3)
depends=('dotnet-runtime>=7' libadwaita)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
source=("git+$url#tag=$pkgver" "git+${url%denaro}cakescripts#commit=75d0c1859b062b57d73fb466321258b00c94d6ef")
b2sums=('SKIP' 'SKIP')

prepare() {
	rm -rf $pkgname/CakeScripts
	mv cakescripts $pkgname/CakeScripts
	cd $pkgname
	dotnet tool restore
}

build() {
	cd $pkgname
	dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
	cd $pkgname
	dotnet cake --target=Install --destdir="$pkgdir"
}
