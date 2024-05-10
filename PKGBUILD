# Maintainer: hjmjaa-aur <aur AT hjmjaa DOT com>

_pkgname=wait_ex
pkgname="$_pkgname-git"
pkgver=0.1.0.r2.g330d3cb
pkgrel=1
pkgdesc="Replacement of Bash's wait with error handling"
arch=('x86_64')
url="https://git.sr.ht/~mjaa/$_pkgname"
license=('MIT')
groups=()
depends=(glibc gcc-libs)
makedepends=(nim git)
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+$url")
noextract=()
md5sums=(SKIP) # updpkgsums

pkgver() {
	cd "$_pkgname"
	git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

build() {
	cd "$_pkgname"
	nimble -d:release build
}

package() {
	cd "$_pkgname"
	install -Dm 755 wait_ex -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
}
