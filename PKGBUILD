# Maintainer: igo95862 <address at domain dot tld>
pkgname=bubblejail-git
pkgver=r241.8fae4d6
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=('python' 'python-xdg' 'bubblewrap' 'python-toml' 'xdg-dbus-proxy' 'hicolor-icon-theme')
makedepends=('git' 'meson')
provides=('bubblejail')
source=("$pkgname"::"git+https://github.com/igo95862/bubblejail")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check () {
	meson test -C build --print-errorlogs
}

build () {
	arch-meson "$srcdir/$pkgname" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
