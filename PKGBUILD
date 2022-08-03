# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=hiprompt-gtk-py
_revision=18 # git rev-list --count master
_commit=f744993
pkgver="r$_revision.$_commit"
pkgrel=1
pkgdesc='A GTK+ Himitsu prompter for Wayland'
arch=(any)
url='https://sr.ht/~sircmpwn/himitsu'
license=(GPL3)
depends=(python python-gobject gtk3 gtk-layer-shell)
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$_commit.tar.gz")
_extractedpath="$pkgname-$_commit"
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_extractedpath"
	meson --prefix=/usr --buildtype=plain . build
	meson compile -C build
}

check() {
	cd "$srcdir/$_extractedpath"
	meson test --no-rebuild -C build
}

package() {
	cd "$srcdir/$_extractedpath"
	env DESTDIR="$pkgdir" MESON_INSTALL_PREFIX="/usr" meson install --no-rebuild -C build
}
