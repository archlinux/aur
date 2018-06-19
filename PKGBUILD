#Maintainer: Stuart Reilly <stu at reilly-family dot co dot uk>
pkgname=rash-git
pkgver=0.3.0.r20.g767650d
pkgdesc='Rust-based file hashing tool'
pkgrel=1
license=('MIT' 'Apache')
makedepends=('cargo' 'git')
arch=('x86_64')
url='https://github.com/themadprofessor/rash'
sha1sums=('SKIP')

source=("git+$url")

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd "${pkgname%-*}"
	cargo build --release
}

package() {
	cd "${pkgname%-*}"
	install -Dm755 target/release/rash "$pkgdir/usr/bin/rash"
}
