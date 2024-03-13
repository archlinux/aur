# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: JJ Style <aur@jj-style.slmail.me>
_repo=gobal-player
pkgname=gobal-player-tui
pkgver=0.1.6
pkgrel=1
epoch=
pkgdesc="Unofficial TUI app for Global Player radio."
arch=("x86_64")
url="https://github.com/jj-style/$_repo"
license=('GPL-3.0-or-later')
groups=()
depends=("vlc" "glibc")
makedepends=("go>=1.22", "git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_repo-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('9cd3d34f46d2815abdf2c6726432206b38c997ddeff9e0a9bdb669d5224b299d')
validpgpkeys=()

build() {
	cd "$_repo-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o $pkgname ./cmd/$pkgname
}

package() {
	cd "$_repo-$pkgver"
	install -vDm755 -t "$pkgdir/usr/bin" $pkgname
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
