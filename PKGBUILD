# Maintainer: Jacob Moody <moody at posixcafe dot org>
pkgname=drawterm-9front-wl-git
pkgver=r522.05c9c55
pkgrel=1
pkgdesc="9front drawterm compiled targeting wayland + pipewire"
arch=('i686' 'x86_64')
url="http://drawterm.9front.org/"
license=('MIT')
depends=('pipewire' 'wayland')
makedepends=('make' 'gcc' 'git' 'wayland-protocols')
provides=('drawterm')
conflicts=('drawterm')
source=("$pkgname::git://git.9front.org/plan9front/drawterm")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	CONF=linux make -j `nproc`
}

package() {
	cd "$srcdir/$pkgname"
        install -Dm755 drawterm $pkgdir/usr/bin/drawterm
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 drawterm.1 "$pkgdir/usr/share/man/man1/drawterm.1"
}
