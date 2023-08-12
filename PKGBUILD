# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic
pkgver=2023.8.1
pkgrel=1
pkgdesc='An easy-to-use video downloader'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/$pkgname
license=(GPL3)
depends=(aria2 'dotnet-runtime>=7' ffmpeg libadwaita python-brotli python-mutagen python-pycryptodomex python-pyxattr python-websockets yt-dlp python-psutil)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
provides=(tube-converter)
replaces=(tube-converter)
conflicts=(tube-converter)
source=(git+$url#tag=$pkgver)
b2sums=('SKIP')

prepare() {
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
	ln -sv org.nickvision.tubeconverter "$pkgdir"/usr/bin/$pkgname
}

