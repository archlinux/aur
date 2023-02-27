# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=sync-current-directory-git
pkgver=r52.9b243ff
pkgrel=1
epoch=
pkgdesc="Sync current directory between your shell and a file manager"
arch=("any")
url="https://github.com/cshuaimin/scd"
license=('MIT')
groups=()
depends=('fish')
makedepends=('cargo' 'git')
checkdepends=()
optdepends=()
provides=('scd')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/cshuaimin/scd.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

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
