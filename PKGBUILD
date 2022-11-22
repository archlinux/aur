# Maintainer: éclairevoyant

_pkgname=c2nim
pkgname="$_pkgname-git"
pkgver=0.9.18.r24.bc8edce
pkgrel=1
epoch=1
pkgdesc="Tool to translate Ansi C code to Nim"
arch=('i686' 'x86_64')
url="https://github.com/nim-lang/$_pkgname"
license=('MIT')
groups=('nim')
depends=('nim')
makedepends=('git' 'openssl-1.1' 'nimble')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git?signed")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub (web-flow commit signing) <noreply@github.com>

pkgver() {
	cd $pkgname
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	nimble build -y
}

package() {
	cd $pkgname
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 "doc/$_pkgname.rst" -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/c2nim/README"
}
