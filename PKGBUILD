# Maintainer: Stuart Reilly <stu at reilly-family dot co dot uk>
pkgname=rash-git
pkgver=0.3.1.r23.g87f0710
pkgrel=2
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Rust-based file hashing tool"
license=('MIT' 'Apache')
url="https://github.com/themadprofessor/rash"
source=("git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd "$srcdir/${pkgname%-*}"
	cargo build --release
}

package() {
    	cd "$srcdir/${pkgname%-*}"
    	install -Dm755 target/release/rash $pkgdir/usr/bin/rash
}
