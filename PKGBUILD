# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Luke <Infinitybeond1@protonmail.com>

pkgname=nfetch-git
_pkg="${pkgname%-git}"
pkgdesc="Minimal Linux fetch utility written in nim"
pkgver=2.r19.g2655d63
pkgrel=4
arch=('x86_64')
url="https://github.com/Infinitybeond1/nfetch-src"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'nimble')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkg"
	nimble -y build -d:release
}

package() {
	cd "$_pkg"
	install -Dv "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 config.ini -t "$pkgdir/usr/share/doc/$_pkg/"
}
