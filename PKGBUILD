# Maintainer: Jonah Barkley-Griggs <jbarkleygriggs@gmail.com>
_pkgname=wayvy-applet
pkgname="${_pkgname}-git"
pkgver=r0.0000000
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
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "packaging/wayvy-applet.service" -t "$pkgdir/usr/lib/systemd/user/"
}
