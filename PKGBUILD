# Maitainer: Loek Le Blansch <loek@pipeframe.xyz>

pkgname=arduino-language-server-git
pkgver=1.0.1
pkgrel=1
pkgdesc="An Arduino Language Server based on Clangd to Arduino code autocompletion"
arch=('any')
makedepends=('git' 'go')
url="https://github.com/arduino/arduino-language-server"
license=('APACHE')
source=(git+https://github.com/arduino/arduino-language-server)
sha256sums=('SKIP')
provides=('arduino-language-server')
conflicts=('arduino-language-server')

pkgver() {
	cd ${pkgname%-git}
	git rev-parse HEAD | cut -c1-7
}

build() {
	cd ${pkgname%-git}

	msg2 'Building...'
	go build
}

package() {
	cd ${pkgname%-git}

	msg2 'Installing executables...'
	install -Dm 755 arduino-language-server -t "$pkgdir"/usr/bin

	msg2 'Cleaning up pkgdir...'
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
