# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
pkgname=kmonad-git
pkgver=0.4.1.r145.g1b32405
pkgrel=2
pkgdesc="An advanced keyboard manager"
arch=('any')
url="https://github.com/kmonad/kmonad"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'stack') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/kmonad/kmonad")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	stack build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	stack install --local-bin-path="$pkgdir/usr/bin"
	install -Dm644 "startup/${pkgname%-git}.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
