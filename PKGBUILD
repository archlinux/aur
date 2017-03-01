# Maintainer: Josh Klar <j@iv597.com>
pkgname=mplugd-git
pkgver=0.1
pkgrel=1
pkgdesc="Daemon that listens on events (e.g. xrandr or pulseaudio) and executes user-defined actions on certain events"
arch=('i686' 'x86_64')
url="https://github.com/anyc/mplugd"
license=('GPL2')
conflicts=('mplugd')
provides=('mplugd')
groups=()
depends=()
optdepends=(
	'python2-dbus: For pulseaudio support'
	'python2-xlib: For Xorg events'
	'python2-pyudev: For udev support'
)
makedepends=('python2-setuptools')

_gitroot='https://github.com/anyc/mplugd.git'
_gitname='mplugd'

build() {
	cd "$srcdir"
	msg "Connecting to GIT server..."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
}

package() {
	cd "$srcdir/$_gitname"

	python2 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}
