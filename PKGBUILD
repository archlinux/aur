# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-done
_reponame='done'
pkgver=1.14.10
pkgrel=1
pkgdesc='Receive notifications when long processes finish in fish'
arch=(any)
url="https://github.com/franciscolourenco/$_reponame/"
license=(MIT)
depends=('fish>=2.3.0')
checkdepends=('fish-fishtape')
optdepends=('jq: for use with sway'
            'libnotify: notification backend'
            'notify-desktop: notification backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('388d392ab7c790fa05086bbd7935a5449e39358e0a8202116f234f2b1dd6ad30')

check() {
	cd "$_reponame-$pkgver"
	fish -c 'fishtape "test/done.fish"'
}

package() {
	cd "$_reponame-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/etc/fish/conf.d" 'conf.d/done.fish'
}
