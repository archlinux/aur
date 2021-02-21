# Maintainer: Rupansh <rupanshsekar@hotmail.com>
pkgname=passmenu-rs-git
pkgver=0.3.1.r0.g5385851
pkgrel=1
pkgdesc='Rofi frontend for passmenu'
arch=('any')
url='https://github.com/rupansh/passmenu-rs'
license=('GPL3')
depends=('pass')
makedepends=('rust' 'git')
optdepends=('pass-otp: pass-otp support')
source=("passmenu-rs::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/passmenu-rs"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/passmenu-rs"
	cargo build --release
}

package() {
	cd "${srcdir}/passmenu-rs"
	install -D target/release/passmenu-rs -t "$pkgdir"/usr/bin
	install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/passmenu-rs
}
