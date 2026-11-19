# Maintainer: Koen Hendriks <info@koenhendriks.nl>

pkgname=vox
pkgver=0.3.2
pkgrel=1
pkgdesc='Make your microphone sound better in every app, with switchable voice profiles'
arch=('x86_64' 'aarch64')
url='https://github.com/koenhendriks/vox'
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-svg' 'qt6-wayland' 'pipewire' 'pipewire-pulse' 'libpulse'
         'swh-plugins' 'noise-suppression-for-voice')
makedepends=('gcc' 'make')
_src="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d54de62725589a968d116f2a1536c5840ddc9bb6452e8943d12ed1d911cc4e5f')

build() {
	cd "$_src"
	./bin/build
}

check() {
	cd "$_src"
	./bin/test
}

package() {
	cd "$_src"
	install -Dm755 build/vox "$pkgdir/usr/bin/vox"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 pkgbuild/vox.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/vox.svg"
	install -Dm644 pkgbuild/vox.desktop "$pkgdir/usr/share/applications/vox.desktop"
	install -Dm644 pkgbuild/vox.service "$pkgdir/usr/lib/systemd/user/vox.service"
	install -Dm644 pkgbuild/vox-tray.desktop "$pkgdir/etc/xdg/autostart/vox-tray.desktop"
}
