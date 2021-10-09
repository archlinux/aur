pkgname=matebook-applet
pkgver=3.0.2
pkgrel=2
pkgdesc="System tray applet/control app for Huawei Matebook"
arch=('x86_64')
url="https://github.com/nekr0z/matebook-applet"
license=('GPL')
depends=('libappindicator-gtk3')
optdepends=('huawei-wmi-dkms: for kernels without huawei-wmi.')
makedepends=('go' 'libayatana-appindicator')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/nekr0z/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9ba43b52e2755eed747a5c847d1b9f50c47ae9faf8dc830981c905d7873cb2d4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go run build.go
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 matebook-applet "$pkgdir/usr/bin/matebook-applet"
	install -Dm644 matebook-applet.desktop "$pkgdir/usr/share/applications/matebook-applet.desktop"
	install -Dm644 assets/matebook-applet.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/matebook-applet.png"
	install -Dm644 matebook-applet.1 "$pkgdir/usr/share/man/man1/matebook-applet.1"
}
