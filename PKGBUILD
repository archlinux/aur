# Maintainer: Jason Papakostas <vithos@gmail.com>
pkgname=epaste-git
pkgver=v1.0.0.r0.7e961c5
pkgrel=1
pkgdesc="encrypts given text and turns encrypted bytes into base64 text which can be easily pasted/retrieved on pastebin websites"
arch=('i686' 'x86_64')
url="https://github.com/zetok/epaste"
license=('GPL3')
groups=()
depends=('gcc-libs' 'libsodium')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "$srcdir/${pkgname%-git}/target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
