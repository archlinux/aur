# Maintainer: Jerry Stevens <sammynx at gmx dot com>
pkgname=cloudman
pkgver=0.1.7
pkgrel=1
pkgdesc="A textual user interface (heavily inspired by htop) to manage your Amazon EC2 fleet"
arch=('x86_64')
url="https://github.com/dutchcoders/cloudman"
license=('MIT')
depends=()
makedepends=('cargo' 'git' 'make')
checkdepends=()
optdepends=()
provides=($pkgname)
conflicts=($pkgname)
install=
source=(${pkgname}::git+${url}.git)
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --tags | sed 's/-.*//'
}

build() {
	cd "${pkgname}"
	cargo build --release
}

package() {
	cd "${pkgname}"
	install -Dm 755 "target/release/cloudman" -t "${pkgdir}/usr/bin"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

#vim: syntax=sh
