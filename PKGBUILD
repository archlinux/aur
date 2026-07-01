# Maintainer: Mohannad Ahmed <mohannadabdo21@hotmail.com>

pkgname=arch-rss-notify
pkgver=0.1.2
pkgrel=1
pkgdesc='Arch Linux package RSS feed notifier - polls feeds and sends desktop notifications for installed package updates'
arch=('x86_64' 'aarch64')
url='https://github.com/Mohabdo21/arch-rss-notify'
license=('MIT')
depends=('libnotify')
makedepends=('go' 'git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mohabdo21/arch-rss-notify/archive/v$pkgver.tar.gz")
sha256sums=('be46e6f42d258c2bc1e24446949e70ca637ca5e4c5fbf6e010b00c5eab3e086c')

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOAMD64=v3
	export GOFLAGS='-buildmode=pie'
	go build -trimpath -o rss-notify .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 rss-notify "$pkgdir/usr/bin/rss-notify"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 rss-notify.service "$pkgdir/usr/lib/systemd/user/rss-notify.service"
}
