# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
# Based on run0-sudo-shim-git by Lyna Stral <testerthe60@gmail.com>

pkgname=run0-sudo-shim-selinux
pkgver=1.3.0
pkgrel=1
pkgdesc="sudo imitation using run0 internally, patched to default-inject --via-shell so escalated commands run in a proper SELinux domain (e.g. pacman -> rpm_t). WARNING: !!! THIS REPLACES SUDO !!!"
arch=('any')
url="https://github.com/nikicat/run0-sudo-shim"
license=('BSD-3-Clause')
depends=('systemd>=256.0')
makedepends=('git' 'rust')
provides=('sudo')
conflicts=('sudo' 'run0-sudo-shim-git')
backup=('etc/run0-sudo-shim.conf')
source=("${pkgname}::git+${url}#tag=${pkgver}"
        "run0-sudo-shim.conf")
sha256sums=('SKIP'
            'SKIP')

build() {
	cd "$srcdir"/${pkgname}
	cargo build --release
}

package() {
	cd "$srcdir"/${pkgname}
	install -Dm 0755 "target/release/run0-sudo-shim" "${pkgdir}/usr/bin/sudo"
	install -Dm 0644 "$srcdir"/run0-sudo-shim.conf "${pkgdir}/etc/run0-sudo-shim.conf"
}
