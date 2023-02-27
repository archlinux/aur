# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=tube-converter-git
pkgver=2023.3.0.beta1.p1.r27.g6fb0411
pkgrel=1
pkgdesc='An easy-to-use video downloader'
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/nlogozzo/nickvisiontubeconverter
license=(GPL3)
depends=('dotnet-runtime>=7' ffmpeg libadwaita python-brotli python-mutagen python-pycryptodomex python-pyxattr python-websockets yt-dlp)
makedepends=(blueprint-compiler cmake 'dotnet-sdk>=7' git just)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)

pkgver() {
	cd nickvisiontubeconverter
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	just nickvisiontubeconverter/NickvisionTubeConverter.GNOME/ publish "$pkgdir"/usr
}
