# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>

pkgname=run0-sudo-shim
pkgver=1.3.1
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
sha256sums=('bc3f535bf9eb2bf74be4b4408b3c7d543a53d97fa207c69158abd1dab16435b0')

build() {
	cd "$srcdir"/${pkgname}-${pkgver}
	cargo build --release
}

package() {
	cd "$srcdir"/${pkgname}-${pkgver}
	install -Dm 0755 "target/release/run0-sudo-shim" "${pkgdir}/usr/bin/sudo"
}
