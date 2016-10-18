pkgname=watchexec-git
pkgver=1.0.0.62
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
arch=('x86_64' 'i686')
url="https://github.com/mattgreen/watchexec"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
optdepends=()
provides=('watchexec')
conflicts=('watchexec')
source=($pkgname::git+https://github.com/mattgreen/watchexec)
md5sums=('SKIP')

pkgver() {
    cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)
}

build() {
    cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/watchexec" "$pkgdir/usr/bin/watchexec"
}
