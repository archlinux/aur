# Maintainer: igo95862 <address at domain dot tld>
pkgname=bubblejail-git
pkgver=r287.2e1df52
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=('python' 'python-xdg' 'bubblewrap' 'python-toml' 'xdg-dbus-proxy' 'hicolor-icon-theme' 'python-pyqt5' 'desktop-file-utils')
provides=('bubblejail')
conflicts=('bubblejail')
optdepends=(
	'bash-completion: completions for bash shell'
	'fish: completions for fish shell'
	)
makedepends=('git' 'meson' 'm4' 'python-sphinx')
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
