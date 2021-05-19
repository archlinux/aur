# Maintainer: Francesco Zardi <frazar at hotmail dot it>
pkgname=fish-done
_reponame='done'
pkgver=1.16.2
pkgrel=1
pkgdesc='Receive notifications when long processes finish in fish'
arch=(any)
url="https://github.com/franciscolourenco/$_reponame/"
license=(MIT)
depends=('fish>=2.3.0')
checkdepends=('fish-fishtape')
optdepends=('jq: for use with sway'
            'libnotify: notification backend'
            'notify-desktop-git: notification backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('035f9f37373ad892e09b8ed146c4661e2b9c583a3c0367bb3a2930400eb99a08')

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
