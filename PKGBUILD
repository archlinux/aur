# Maintainer: Jonah Barkley-Griggs <jbarkleygriggs@gmail.com>
_pkgname=wayvy-applet
pkgname="${_pkgname}-git"
pkgver=r3.0000001
pkgrel=1
pkgdesc="A quick and dirty ksni applet for the Wayvy wallpaper manager."
url="https://codeberg.org/J_S_Barkely-Griggs/Wayvy-applet"
license=('GPL-3.0')
arch=('x86_64')
depends=('mpvpaper' 'wayvy')
makedepends=('rust' 'cargo' 'make' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "wayvy-applet.service" -t "$pkgdir/usr/lib/systemd/user/"
}
