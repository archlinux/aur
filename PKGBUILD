# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-done
_reponame='done'
pkgver=1.13.0
pkgrel=1
pkgdesc='Receive notifications when long processes finish in fish'
arch=(any)
url="https://github.com/franciscolourenco/$_reponame/"
license=(MIT)
depends=('fish>=2.3.0' 'fish-humanize-duration')
checkdepends=('fish-fishtape')
optdepends=('jq: for use with sway'
            'libnotify: notification backend'
            'notify-desktop: notification backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7f95d91c99794fbc49a80da42d7eb8c8767585614cb9993f93dd3fe040c44e72')

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
