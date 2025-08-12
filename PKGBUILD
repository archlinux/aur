# Maintainer: Lyna Stral <testerthe60@gmail.com>

pkgname=run0-sudo-shim-git
pkgver=1.2.0.r8.g84b51f4
pkgrel=1
pkgdesc="An imitation of sudo, using run0 internally - WARNING: !!! THIS REPLACES SUDO !!!"
arch=('any')
url="https://github.com/LordGrimmauld/run0-sudo-shim"
license=('BSD-3-Clause')
depends=('systemd>=256.0')
makedepends=('git' 'rust')
provides=('sudo')
conflicts=('sudo')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"/${pkgname}
	cargo build --release
}

package() {
	cd "$srcdir"/${pkgname}
	install -Dm 0755 "target/release/run0-sudo-shim" "${pkgdir}/usr/bin/sudo"
}
