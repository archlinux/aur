# Maintainer: Oktay <oktay@yatko.dev>
_pkgname=rat
pkgname=$_pkgname-git
pkgver=1.1.0.r3.gcea5287
pkgrel=1
pkgdesc="List, report to issue trackers and purge todos within your Git projects - Git development version"
arch=('x86_64')
url="https://sr.ht/~aod/rat"
license=('MIT')
depends=('libgit2')
makedepends=('git' 'rust' 'cargo' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://git.sr.ht/~aod/rat")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
  	cargo build --release --locked
}

package() {
    cd "$srcdir/$_pkgname"
	install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
