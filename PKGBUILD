# Maintainer: Mikhail Khvoinitsky <aur-dumb-brightness@khvoinitsky.org>
pkgname=dumb-brightness-git
_pkgname=dumb-brightness
pkgdesc='Very simple program to control brightness of your screen, keyboard or whatever exposed via sysfs (written in Rust)'
pkgver=0.1.0.5.g5935363
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/m-khvoinitsky/dumb-brightness'
license=('MIT')
depends=('dbus')
makedepends=('rust' 'cargo' 'git')
source=('git+https://github.com/m-khvoinitsky/dumb-brightness.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	echo "$(grep version Cargo.toml | head -n 1 | awk '{ print $3; }' | tr -d '"').$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cargo build --release
}

package() {
	install -D -m755 "$srcdir/$_pkgname/target/release/dumb-brightness" "$pkgdir/usr/bin/dumb-brightness"
}
