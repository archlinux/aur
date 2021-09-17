# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=gitprompt
pkgver=0.8.0
pkgrel=2
pkgdesc='Informative git prompt for zsh and bash'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/abhinav/gitprompt"
license=('MIT')
makedepends=('go')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7213178f72e1a948c152992534e7167c99c581382b56b1cfcbbf7bb9ac174ab1')

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
