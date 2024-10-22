# Maintainer: Your Name <lemon.xah@gmail.com>
pkgname=slimevr-cli-git
_pkgname=slimevr-cli-git
pkgver=0.1
pkgrel=1
pkgdesc="A SlimeVR command line interface to send commands to the slimevr server. Sending commands like Full-Reset and Yaw-Reset."
arch=('x86_64' 'i686')
url="https://github.com/lemonxah/slimevr-cli"
license=('mit')
makedepends=('rust' 'cargo' 'cmake' 'git')
provides=("slimevr-cli")
conflicts=("slimevr-cli")
source=("$_pkgname::git+https://github.com/lemonxah/slimevr-cli.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release --locked
}

package() {
	cd "$_pkgname"
	install -D -m 755 "target/release/slimevr-cli" "$pkgdir/usr/bin/slimevr-cli"
}
