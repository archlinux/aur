pkgname=mpris-rp-git
_pkgname=mpris-rp
pkgver=r15.5143286
pkgrel=1
pkgdesc="A Rust program to generate Discord rich presences from MPRIS players. "
arch=(any)
url="https://github.com/nickofolas/mpris-rp"
license=('custom')
depends=(gcc-libs)
makedepends=('rust') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=($_pkgname)
install=$pkgname.install
source=($_pkgname::git+$url
       mpris-rp.service)

md5sums=('SKIP'
         '29740850b38217f203b06f7a557f5a95')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	cargo build --release
}

check() {
	cd "$srcdir/${_pkgname}"
	cargo check --release
}

package() {
	cd "$_pkgname"
	install -Dm755 ./target/release/mpris-rp $pkgdir/usr/bin/mpris-rp
	install -Dm644 $srcdir/mpris-rp.service $pkgdir/usr/lib/systemd/user/mpris-rp.service
}
