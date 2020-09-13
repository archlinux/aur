pkgname='vocage-git'
_pkgname="vocage"
pkgver=1.0.0.42.g86f9c6f
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/proycon/vocage"
pkgdesc="A minimalistic terminal-based vocabulary learner or flashcard tool, using a spaced repetition algorithm."
license=('GPL-3.0+')
depends=()
makedepends=('rust' 'cargo' 'git')
checkdepends=()
provides=('vocage')
conflicts=('vocage')
source=("$_pkgname::git+https://github.com/proycon/vocage.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
	cd $_pkgname

	install -D -m755 "target/release/vocage" "$pkgdir/usr/bin/vocage"
}

