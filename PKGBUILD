# Maintainer: igo95862 <address at domain dot tld>
pkgname=bubblejail-git
pkgver=r423.1820189
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=(
    'python'
    'python-xdg'
    'bubblewrap'
    'python-tomli'
    'python-tomli-w'
    'xdg-dbus-proxy'
    'hicolor-icon-theme'
    'python-pyqt5'
    'desktop-file-utils'
    'libnotify'
)
provides=('bubblejail')
conflicts=('bubblejail')
optdepends=(
	'bash-completion: completions for bash shell'
	'fish: completions for fish shell'
	'slirp4netns: Namespaced networking stack'
	)
makedepends=('git' 'meson' 'python-jinja' 'scdoc')
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
	arch-meson "$srcdir/$pkgname" build -Dversion_display="AUR-git $pkgver"
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
