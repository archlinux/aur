# Maintainer: Your Name <lemon.xah@gmail.com>
pkgname=csloc
_pkgname=csloc
pkgver=0.1.2.r0.g90232f1
pkgrel=1
pkgdesc="Counts lines of code based on file extension. Can specify substantial line of code by char count."
arch=('x86_64' 'i686')
url="https://github.com/lemonxah/csloc"
license=('mit')
makedepends=('rust' 'cargo' 'cmake' 'git')
provides=("csloc")
conflicts=("csloc")
source=("$_pkgname::git+https://github.com/lemonxah/csloc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release --locked
}

package_csloc() {
	cd "$_pkgname"

	install -D -m 755 "target/release/csloc" "$pkgdir/usr/bin/csloc"
}
