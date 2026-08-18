# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=sysdvr-client
pkgver=6.3
pkgrel=1
pkgdesc="Stream switch games to your PC via USB or network"
arch=('x86_64' 'aarch64')
url="https://github.com/exelix11/SysDVR"
license=('GPL-2.0-only')
depends=('ffmpeg' 'sdl2' 'sdl2_image' 'libusb' 'libstdc++' 'libgcc' 'glibc' 'dotnet-runtime-9.0')
optdepends=('cimguisdl2cross: GUI support')
makedepends=('dotnet-sdk-9.0')
source=("https://github.com/exelix11/SysDVR/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b527b6b0cb64242f5f9c0f60a87a8893b44f2f5af3c9117f0669513a99bb0e17')

build() {
	cd "SysDVR-${pkgver}/Client/"
	dotnet build Client.csproj -c Release
}

package() {
	cd "SysDVR-${pkgver}/Client/"
	install -Dm755 -t "$pkgdir/opt/SysDVR" bin/Release/net9.0/SysDVR-Client
	install -Dm755 -t "$pkgdir/opt/SysDVR" bin/Release/net9.0/SysDVR-Client.dll
	install -Dm755 -t "$pkgdir/opt/SysDVR" bin/Release/net9.0/SysDVR-Client.runtimeconfig.json
	cp -r bin/Release/net9.0/runtimes "$pkgdir/opt/SysDVR"
} 
