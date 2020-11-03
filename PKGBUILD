# Maitainer: Loek Le Blansch <l.leblansch@gmail.com>

pkgname=go-serversdat-git
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="Minecraft servers.dat tool"
arch=('any')
makedepends=('git' 'go')
url="https://github.com/Jake-E/go-serversdat"
license=('MIT')
source=(git+https://github.com/Jake-E/go-serversdat)
sha256sums=('SKIP')
provides=('serversdat')
conflicts=('serversdat')

pkgver() {
	cd ${pkgname%-git}
	git describe --tags | sed "s+-+.r+" | tr - .
}

prepare() {
	msg2 'Installing dependencies...'
	go get github.com/jedib0t/go-pretty/table github.com/seebs/nbt
}

build() {
	cd ${pkgname%-git}

	msg2 'Building...'
	go build -o serversdat .
}

package() {
	cd ${pkgname%-git}

	msg2 'Installing executables...'
	install -Dm 755 serversdat -t "$pkgdir"/usr/bin

	msg2 'Cleaning up pkgdir...'
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
