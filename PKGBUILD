_pkgname=qwikaccess
pkgname=${_pkgname}-git
pkgver=0.0.1.r65.ae84897
pkgrel=1
pkgdesc="A point and click Qt GUI for scripts we use frequently."
arch=('any')
url="https://github.com/librewish/qwikaccess"
license=('GPL3')
depends=('qt5-base' 'polkit' 'libnotify' 'libpulse' 'brightnessctl' 'inotify-tools' 'ffmpeg')
optdepends=(
	'xorg-xrandr: for screen rotation'
	'xorg-xinput: for autorotation'
	'iio-sensor-proxy: for autorotation'
	'redshift: for night mode'
	'xdg-utils: for lock screen (xdg-screensaver lock)'
	'systemd: for leave commands and gps services'
	'wmctrl: for screencam ffplay to be on above all windows'
	'grim: for wayland screenshot'
	'wf-recorder: for wayland screencapture'
	'grep: used in scripts'
	'gawk: used in scripts'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/librewish/${_pkgname}.git")
md5sums=('SKIP')
install=qwikaccess.install
pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
	qmake-qt5 ${_pkgname}.pro
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT=${pkgdir} install
}
