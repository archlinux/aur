# Maintainer: Marcos Gutiérrez Alonso <margual56@gmail.com>

pkgname=radio-cli-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple radio cli for listening to your favourite streams from the console"
arch=('i686' 'x86_64')
url="https://github.com/margual56/radio-cli"
license=('GPL2')

depends=('mpv')
makedepends=('git' 'cargo')
checkdepends=()
optdepends=()

source=("radio-cli::git+${url}.git")
md5sums=('SKIP')

prepare() {
	mv "./radio-cli" "./${pkgname}"	
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${XDG_CONFIG_HOME}/radio-cli/"
}

build() {
	cd "${srcdir}/${pkgname}"
	git checkout main
	cargo build --release
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/target/release/radio-cli" "${pkgdir}/usr/bin/radio"
	cp "${srcdir}/${pkgname}/config.json" "${XDG_CONFIG_HOME}/radio-cli/config.json"

}

