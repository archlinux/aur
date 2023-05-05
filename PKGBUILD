pkgname=matebook-applet
pkgver=3.1.0
pkgrel=1
pkgdesc="System tray applet/control app for Huawei Matebook"
arch=('x86_64')
url="https://github.com/nekr0z/matebook-applet"
license=('GPL')
depends=('libayatana-appindicator')
optdepends=('huawei-wmi-dkms: for kernels without huawei-wmi.')
makedepends=('go')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nekr0z/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34d6285840f298eba5c61a6673c310d341f3678f0ba2a54cbf9b4917b3410253')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -trimpath -ldflags=-buildid=
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 matebook-applet "$pkgdir/usr/bin/matebook-applet"
	install -Dm644 matebook-applet.desktop "$pkgdir/usr/share/applications/matebook-applet.desktop"
	install -Dm644 assets/matebook-applet.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/matebook-applet.png"
	install -Dm644 matebook-applet.1 "$pkgdir/usr/share/man/man1/matebook-applet.1"
}
