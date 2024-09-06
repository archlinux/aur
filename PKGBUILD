# Maintainer: Yo'av Moshe <pipet@yoavmoshe.com>
pkgname=pipet-git
pkgver=r16.060b068
pkgrel=1
pkgdesc="a swiss-army tool for scraping and extracting data from online assets, made for hackers"
arch=('x86_64' 'aarch64')
url="https://github.com/bjesus/pipet"
license=('MIT')
depends=('git' 'go')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname/cmd/pipet"
	go build -v -o "$srcdir/$pkgname"
}

package() {
	install -Dm755 "$srcdir/$pkgname/pipet" "$pkgdir/usr/bin/pipet"
}
