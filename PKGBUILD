# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sopamo <github@sopamo.de>
pkgname=via-cli-git
pkgver=v0.4.1
pkgrel=1
epoch=
pkgdesc="Easily start & stop your local dev environments from your cli"
arch=(x86_64)
url="https://github.com/Sopamo/via"
license=('MIT')
groups=()
depends=()
makedepends=(deno make)
checkdepends=()
optdepends=()
provides=(via-cli)
conflicts=(via-cli)
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver::git+$url#tag=$pkgver")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	deno compile  --allow-read --allow-run --allow-env --allow-write --target=x86_64-unknown-linux-gnu --output dist/via-linux-x86_64 ./src/via.ts
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "dist/via-linux-x86_64" "${pkgdir}/usr/local/bin/via"
}
