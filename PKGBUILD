# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Demir Yerli <mrquantumoff@protonmail.com>
pkgname=qfetch
pkgver=0.6.0
pkgrel=1
epoch=
pkgdesc="A simple fetch tool written in rust"
arch=(x86_64)
url="https://github.com/mrquantumoff/qfetch"
license=('BSD-2-Clause')
groups=("mrquantumoff")
depends=("xdg-desktop-portal")
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=("qfetch")
source=("https://github.com/mrquantumoff/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	cargo clean
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}


package() {
	cd "$pkgname-$pkgver/target/release"
	install -Dm755 -t "${pkgdir}/usr/bin/" qfetch
	chmod +x $pkgdir/usr/bin/qfetch
}
