pkgname=matebook-applet
pkgver=3.0.3
pkgrel=1
pkgdesc="System tray applet/control app for Huawei Matebook"
arch=('x86_64')
url="https://github.com/nekr0z/matebook-applet"
license=('GPL')
depends=('libappindicator-gtk3')
optdepends=('huawei-wmi-dkms: for kernels without huawei-wmi.')
makedepends=('go' 'libayatana-appindicator')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nekr0z/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('a948673d5fd51b8a53fe11397982dc80245339936d3f9f47f47e520622862eb1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 matebook-applet "$pkgdir/usr/bin/matebook-applet"
	install -Dm644 matebook-applet.desktop "$pkgdir/usr/share/applications/matebook-applet.desktop"
	install -Dm644 assets/matebook-applet.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/matebook-applet.png"
	install -Dm644 matebook-applet.1 "$pkgdir/usr/share/man/man1/matebook-applet.1"
}
