# Maintainer: Moritz Poldrack <moritz (at) poldrack (dot) dev>
# Contributor: Vincent Loupmon <vloupmong@gmail.com>

pkgname=slit
pkgver=1.3.0
pkgrel=1
pkgdesc="A modern PAGER for viewing logs, get more than most in less time. Written in Go"
arch=('x86_64' 'i686' 'arm64')
url="https://github.com/tigrawap/slit"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/tigrawap/slit/archive/1.3.0.tar.gz")
sha256sums=('052b8d91d7158336adb4d04e5cf127be41d1c408aa896bfa6cc7fa1a0a16d014')

prepare() {
	cd "$pkgname-$pkgver"
	sed 's/-ldflags="-w -s"/-ldflags="-w -s" -buildmode=pie -trimpath -mod=readonly/' -i Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make makedir build
}

package() {
	install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm755 "$srcdir"/$pkgname-$pkgver/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
