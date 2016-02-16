_pkgname=cargo-clippy
pkgname=$_pkgname-git
pkgver=r18.c3f6ba5
pkgrel=1
pkgdesc="A cargo subcommand that runs the clippy linter"
url="https://github.com/arcnmx/cargo-clippy"
depends=('cargo')
provides=($_pkgname)
arch=('i686' 'x86_64')
license=('MIT')
source=("$_pkgname::git+https://github.com/arcnmx/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	if hash multirust 2>/dev/null; then
		multirust run nightly cargo build --release
	else
		cargo build --release
	fi
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
