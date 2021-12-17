# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=gitprompt
pkgver=0.8.1
pkgrel=2
pkgdesc='Informative git prompt for zsh and bash'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/abhinav/gitprompt"
license=('MIT')
makedepends=('go')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e76708f070c790a2157594ab73730b5d973357313e32f77225be023c2f0fbf5c')

_gopackagepath=github.com/abhinav/gitprompt/cmd/gitprompt

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	go build -o "$pkgname" "$_gopackagepath"
}

check() {
	cd "$pkgname-$pkgver"
	"./$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
