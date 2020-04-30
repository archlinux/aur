pkgname=zz-git
pkgver=0.1.1.235.ga1557a5
pkgrel=1
pkgdesc="ZetZ a zymbolic verifier and tranzpiler to bare metal C"
arch=('x86_64' 'i686')
url="https://github.com/zetzit/zz"
license=('MIT' 'Apache')
depends=('z3')
makedepends=('cargo' 'git')
optdepends=()
provides=('zz')
conflicts=('zz')
source=($pkgname::git+https://github.com/zetzit/zz)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/zz" "$pkgdir/usr/bin/zz"
}
