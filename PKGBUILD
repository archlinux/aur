# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=zsa-wally
pkgver=2.0.0
pkgrel=1
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libusb')
provides=('wally')
source=("https://github.com/zsa/wally/archive/${pkgver}-linux.tar.gz"
	"50-wally.rules"
)
sha256sums=('9dd7dc0b62e3b8ae15684cb10995a8ff04e285ef0bf1a61069040bd7c5c13683'
	'SKIP'
)

build() {
     export GOPATH="$srcdir"/gopath
     cd "$srcdir/wally-$pkgver-linux"
     go get -u github.com/wailsapp/wails/cmd/wails
     wails build
}


package() {
	install -Dm644 50-wally.rules "$pkgdir"/etc/udev/rules.d/50-wally.rules
	install -Dm755 $srcdir/wally-$pkgver-linux/build/wally "$pkgdir"/usr/bin/wally
}
