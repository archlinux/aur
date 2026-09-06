# Maintainer: Mohannad Ahmed <mohannadabdo21@hotmail.com>
pkgname=cpumon
pkgver=0.2.7
pkgrel=1
pkgdesc='Real-time CPU monitoring for Linux - temperatures, frequencies, throttling, and fan status'
arch=('x86_64' 'aarch64')
url='https://github.com/Mohabdo21/cpumon'
license=('MIT')
makedepends=('go' 'git')
depends=('libcap')
install=cpumon.install
source=("$pkgname::git+https://github.com/Mohabdo21/cpumon.git#tag=v$pkgver")
sha256sums=('6de4c4e022d6697ac30f2cc803c9ffbfe42385b5076ba5bc7a99e333025ad2ad')

build() {
	cd "$pkgname"
	export CGO_ENABLED=0
	export GOAMD64=v3
	export GOFLAGS='-buildmode=pie'
	go build -trimpath -o "$pkgname" .
}

package() {
	cd "$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
