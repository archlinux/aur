# Contributor: Lennard Hofmann <lennard dot hofmann at web dot de>
# Maintainer: Francesco Zardi <frazar at hotmail dot it>
pkgname=fish-done
_reponame='done'
pkgver=1.19.0
pkgrel=1
pkgdesc='Receive notifications when long processes finish in fish shell'
arch=(any)
url="https://github.com/franciscolourenco/$_reponame"
license=(MIT)
depends=('fish>=2.3.0')
checkdepends=('fish-fishtape')
optdepends=('jq: for use with sway'
            'libnotify: notification backend'
            'notify-desktop-git: notification backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bfbe803bf3c93d155fe4fe498dde921b2ef99bb7103c16cf75900e399f0d06fa')

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
