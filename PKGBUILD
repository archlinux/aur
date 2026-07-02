# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>

pkgname=run0-sudo-shim
pkgver=1.4.2
pkgrel=1
pkgdesc="An imitation of sudo, using run0 internally - WARNING: !!! THIS REPLACES SUDO !!!"
arch=('any')
url="https://github.com/LordGrimmauld/run0-sudo-shim"
license=('BSD-3-Clause')
depends=('systemd>=256.0')
makedepends=('rust')
provides=('sudo')
conflicts=('sudo' 'run0-sudo-shim-git')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ddb7e16e95f8f2a3eba2d7cc489919e3a636586b93d41e113778ce3b8caf2f70')

build() {
	cd "$srcdir"/${pkgname}-${pkgver}
	cargo build --release
}

package() {
	cd "$srcdir"/${pkgname}-${pkgver}
	install -Dm 0755 "target/release/run0-sudo-shim" "${pkgdir}/usr/bin/sudo"
}
