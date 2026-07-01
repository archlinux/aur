# Maintainer: Mohannad Ahmed <mohannadabdo21@hotmail.com>

pkgname=arch-rss-notify
pkgver=0.1.1
pkgrel=1
pkgdesc='Arch Linux package RSS feed notifier - polls feeds and sends desktop notifications for installed package updates'
arch=('x86_64' 'aarch64')
url='https://github.com/Mohabdo21/arch-rss-notify'
license=('MIT')
depends=('libnotify')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mohabdo21/arch-rss-notify/archive/v$pkgver.tar.gz")
sha256sums=('b76a6cb2f53bd33e852537c6ea1e82d2674e0d38009b421cec5eeb68235996d9')

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
