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
source=("$pkgname::git+https://github.com/Mohabdo21/arch-rss-notify.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	export CGO_ENABLED=0
	export GOAMD64=v3
	export GOFLAGS='-buildmode=pie'
	go build -trimpath -o rss-notify .
}

package() {
	cd "$pkgname"
	install -Dm755 rss-notify "$pkgdir/usr/bin/rss-notify"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 rss-notify.service "$pkgdir/usr/lib/systemd/user/rss-notify.service"
}
