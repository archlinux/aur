# Maintainer: Mikhail Khvoinitsky <aur-dumb-pulse-volume@khvoinitsky.org>
pkgname=dumb-pulse-volume-git
_pkgname=dumb-pulse-volume
pkgdesc='Very simple program to control volume of currently playing device or application (written in Rust)'
pkgver=0.1.0.6.g542b519
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/m-khvoinitsky/dumb-pulse-volume'
license=('MIT')
depends=('dbus' 'libpulse')
makedepends=('rust' 'cargo' 'git')
source=('git+https://github.com/m-khvoinitsky/dumb-pulse-volume.git')
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
	install -D -m755 "$srcdir/$_pkgname/target/release/dumb-pulse-volume" "$pkgdir/usr/bin/dumb-pulse-volume"
}
