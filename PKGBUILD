# Maintainer: Josh Meranda <joshmeranda@gmail.com>
_pkgname=wrash
pkgname=$_pkgname-git
pkgver=0.1.3
pkgrel=1
pkgdesc="A minimalistic command wrapper shell"
arch=(x86_64)
url="https://github.com/joshmeranda/wrash"
license=('MIT')
groups=()
depends=()
makedepends=("rust" "cargo" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("$_pkgname::git+https://github.com/joshmeranda/wrash.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
    grep version ../wrash/Cargo.toml | cut -d \" -f 2
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --locked
}

check() {
	cd "$srcdir/$_pkgname"
    cargo test -q -- --test-threads 1 --include-ignored
}

package() {
    cd "$srcdir/$_pkgname"
    install -D --mode 755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
