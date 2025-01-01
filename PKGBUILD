# Maintainer: Sascha Loishandl <sascha.loishandl@gmail.com>
pkgname=mangoverlay
pkgver=0.3.6
pkgrel=1
pkgdesc="GUI app for managing your MangoHud configuration."
arch=('x86_64')
url="https://github.com/loissascha/MangOverlay"
license=('MIT')
depends=('webkit2gtk-4.1' 'vulkan-tools' 'mangohud') 
makedepends=('go' 'git' 'npm' 'gcc' 'gtk3' 'webkit2gtk' 'pkgconf') 
source=("https://github.com/loissascha/MangOverlay/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1109b5f826800c355c851999f9d3fe52c13d351030ee4f71beed003358fa7350') 

build() {
	go version
	go install github.com/wailsapp/wails/v2/cmd/wails@latest
	export PATH=$PATH:~/go/bin
	cd "$srcdir/MangOverlay-$pkgver"
	wails build -tags webkit2_41
}

package() {
	cd "$srcdir/MangOverlay-$pkgver/build"
	install -Dm755 "bin/mangoverlay" "$pkgdir/usr/bin/mangoverlay"
	install -Dm644 "aur/mangoverlay.desktop" "$pkgdir/usr/share/applications/mangoverlay.desktop"
	install -Dm644 "mangoverlay.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/mangoverlay.png"
}
