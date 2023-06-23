
# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Asuka Minato
pkgname=sync-current-directory-git
pkgver=r52.9b243ff
pkgrel=1
pkgdesc="Sync current directory between your shell and a file manager"
arch=("any")
url="https://github.com/cshuaimin/scd"
license=('MIT')
depends=('fish')
makedepends=('cargo' 'git')
provides=('scd')
source=("git+https://github.com/cshuaimin/scd.git")
sha256sums=('SKIP')

pkgver(){
        cd scd
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	pushd scd
	cargo build --release
}

package() {
        pushd scd
	install -Dm755 target/release/scd -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
