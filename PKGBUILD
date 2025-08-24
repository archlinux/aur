# Maintainer: Your Name <sofia@teascade.net>
pkgname=pipeswitchd
pkgver=1.0.2
pkgrel=1
pkgdesc="Daemon for PipeWire that automatically links audio inputs and outputs based on regular expressions, similar to patchbay."
arch=('any')
url="https://github.com/Teascade/pipeswitch"
license=('GPL3')
depends=('pipewire')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname}"
  	install -Dm755 "${srcdir}/${pkgname}/target/release/pipeswitchd" "${pkgdir}/usr/bin/pipeswitchd"
  	install -Dm755 "${srcdir}/${pkgname}/contrib/pipeswitchd.service" "${pkgdir}/usr/lib/systemd/user/pipeswitchd.service"
}
