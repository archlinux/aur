# Maintainer: Alessandro Marchioro <marciozgaming@gmail.com>
pkgname=ryujinx-git
pkgver=1.0.0
pkgrel=4
pkgdesc="Experimental Nintendo Switch Emulator written in C# - master branch"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=(dotnet-runtime)
makedepends=(git dotnet-runtime dotnet-sdk)
optdepends=()
provides=(ryujinx)
source=("git+$url")
md5sums=('SKIP')

build() {
	cd "Ryujinx"
	dotnet publish -c release
	chmod 775 Ryujinx/bin/Release/netcoreapp3.0/Ryujinx
}

package() {
	mkdir -p "$pkgdir/opt/ryujinx/"
	mkdir -p "$pkgdir/usr/bin/"
	cp -R Ryujinx/Ryujinx/bin/Release/netcoreapp3.0/* "$pkgdir/opt/ryujinx/"
        cd "$pkgdir/usr/bin/"
	ln -s "$pkgdir/opt/ryujinx/Ryujinx"
}
