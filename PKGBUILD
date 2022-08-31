# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=gitprompt
pkgver=0.8.2
pkgrel=1
pkgdesc='Informative git prompt for zsh and bash'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/abhinav/gitprompt"
license=('MIT')
makedepends=('go')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cca7b6ff53ae11cda4a5465bdda01fb72add7c170c4a4b419a43a8731b5126e0')

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
