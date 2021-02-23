# Maintainer: okhsunrog <me@gornushko.com>
pkgname=emptty-one-entry
pkgver=0.5.0
pkgrel=3
pkgdesc="Dead simple CLI Display Manager on TTY. Only one login entry, auto choose"
arch=('x86_64')
url="https://github.com/okhsunrog/emptty"
license=('MIT')
depends=('pam' 'libx11')
makedepends=('git' 'go')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/emptty/conf')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-git}"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install-all
    make DESTDIR="$pkgdir/" install-config
    make DESTDIR="$pkgdir/" install-systemd
    printf "disable your DM and run 'systemctl enable emptty' to enable emptty at the next boot\n"
}
