# Maintainer: Térence Clastres <t dot clastres at gmail dot com>

pkgname=gnome-shell-extension-gsconnect-git
pkgver=v13.alpha.r19.ff0328a
pkgrel=1
pkgdesc="KDE Connect implementation with GNOME Shell integration"
arch=('any')
url="https://github.com/andyholmes/gnome-shell-extension-gsconnect"
license=('GPL')
groups=()
depends=('gnome-shell')
optdepends=(
  'sshfs: Browse remote files'
  'folks: Contacts integration (Evolution)'
  'libgdata: Contacts integration (GNOME Online Accounts)'
  'python2-nautilus: Nautilus integration'
  'gsound: Themed sound effects'
)
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
install=
source=('git+'${url})
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd "$srcdir/${pkgname%-git}"

  arch-meson --buildtype=plain build
  ninja -C build
}

check() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson check 
}

package() {
	cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir" ninja -C build install
}
