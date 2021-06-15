
# Maintainer: Abir-Tx <abirtx@yandex.com>
pkgname=appnotex
pkgver=1.1.1
pkgrel=1.2
pkgdesc="Quick terminal based note keeper for Linux Apps"
arch=(x86_64)
url="https://github.com/Abir-Tx/AppNotEx.git"
license=('GPL')
depends=(sqlite3)
makedepends=(git make cmake gzip)
checkdepends=()
optdepends=()
provides=(appnotex)
conflicts=(appnotex)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd AppNotEx
	git submodule init && git submodule update
	make builddir
	cd build
	cmake ..
	make appnotex
}

package() {
	cd AppNotEx
	cd build
	sudo make install

	cd ..
	install -Dm644 -v docs/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 -v LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -v docs/appnotex.1 "${pkgdir}/usr/local/man/man1/appnotex.1"
	sudo gzip "${pkgdir}/usr/local/man/man1/appnotex.1"
	sudo mandb
	# install -Dm644 -v example/config.json "${pkgdir}/usr/share/doc/${pkgname}/config.json"

	# Creating the config directory & copying the example config
	install -Dm644 -v example/config.json "$HOME/.config/appnotex/config.json"
}
