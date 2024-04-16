# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=imgcatr-git
_pkgname=imgcatr
pkgver=0.1.4.r3.g4e1d839
pkgrel=1
pkgdesc="cat for images"
arch=('x86_64')
url="https://github.com/SilinMeng0510/${_pkgname}"
license=('MIT')
makedepends=('git' 'rust')
source=("git+https://github.com/SilinMeng0510/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	cargo build --release --workspace
}

package() {
	install -Dm755 "${_pkgname}/target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
