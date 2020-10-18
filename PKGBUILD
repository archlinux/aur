# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=coil64
_pkgname=Coil64
pkgver=1.2.10
_gitrev=b2d4203e15c274856a073f570c9601bcb47fbb24
pkgrel=2
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=(x86_64)
url="https://coil32.net/"
license=('GPL')
depends=(qt5-base)
source=("https://github.com/radioacoustick/$_pkgname/archive/$_gitrev.tar.gz")
sha512sums=('834ba429d23f6067ddebcde9a0e3ea1e2eed73ba8d768970a545493ff3d995eb14f44e8a5fcecf6333e18ce9fd8d7f898301b9994fdcf8bec742b8caa21689c3')

prepare() {
	cd "$_pkgname-$_gitrev"
	# Arch prefers executables be compiled position-independent
	sed -i -e '/-no-pie/s/^/#/' "$_pkgname.pro"
}

build() {
	cd "$_pkgname-$_gitrev"
	qmake "$_pkgname.pro"
	make
}

package() {
	cd "$_pkgname-$_gitrev"
	install -D "$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
