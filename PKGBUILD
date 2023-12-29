# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=mailpot-git
_pkgname=mailpot
pkgver=0.0.0
pkgrel=1
pkgdesc="Mailing List Manager"
arch=("x86_64")
license=("AGPL3")
url="https://git.meli-email.org/meli/mailpot"
depends=(
	"git"
	"sqlite"
)
makedepends=(
	"rust"
)
provides=("mailpot-git")
optdepends=()
source=(
	"$_pkgname::git+https://git.meli-email.org/meli/mailpot.git"
)

sha256sums=("SKIP")

build() {
	cd $_pkgname
	cargo build --release
}

package() {
	cd $_pkgname
	install -Dm755 "target/release/mpot" $pkgdir/usr/bin/mpot
	install -Dm755 "target/release/mpot-archives" $pkgdir/usr/bin/mpot-archives
	install -Dm755 "target/release/mpot-http" $pkgdir/usr/bin/mpot-http
	install -Dm755 "target/release/mpot-web" $pkgdir/usr/bin/mpot-web
	install -Dm644 "LICENSE" $pkgdir/usr/share/licenses/mailpot
}
