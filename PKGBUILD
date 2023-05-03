# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=tplay-git
pkgver=0.4.0.r128.c0a0d0d
pkgrel=1
epoch=
pkgdesc="A terminal ASCII media player. View images, gifs, videos, webcam, YouTube, etc.. directly in the terminal as ASCII art."
arch=('x86_64')
url="https://github.com/maxcurzi/tplay.git"
license=('MIT')
groups=()
depends=(yt-dlp opencv clang mpv ffmpeg)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(tplay-git)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd tplay
	printf "0.4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd tplay
    cargo build -r --features="mpv_0_35" --no-default-features
}

package() {
	cd tplay
	install -Dm755 target/release/tplay "${pkgdir}/usr/bin/tplay"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
