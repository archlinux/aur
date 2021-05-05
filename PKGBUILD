# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vgrive
pkgver=1.6.1
pkgrel=3
pkgdesc="Google Drive client made in Vala"
arch=('x86_64')
url="https://github.com/bcedu/VGrive"
license=('GPL3')
depends=('gtk3' 'granite' 'libsoup' 'libappindicator-gtk3')
makedepends=('meson' 'vala' 'wayland-protocols')
#checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'https://github.com/bcedu/VGrive/pull/116.patch')
sha256sums=('f125ef74ce1d53517cc45d69716bb9668847d5c406096306aedf2a1178b4bfde'
            'a8b6fe3161377c1fd3ab4e5c585760c12f3d1a58e8db549cd1b7359841e3e5db')

prepare() {
	cd "VGrive-$pkgver"
	patch -Np1 -i "$srcdir/116.patch"
}

build() {
	arch-meson "VGrive-$pkgver" build
	meson compile -C build
}

#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s /usr/bin/com.github.bcedu.vgrive "$pkgdir/usr/bin/$pkgname"
}
