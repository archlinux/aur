# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
pkgname=lutris-git
pkgver=0.5.8.2.r0.gc1edfdd8
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-evdev' 'python-dbus' 'gtk3'
         'glib2' 'psmisc' 'cabextract' 'unzip' 'p7zip' 'curl' 'xorg-xrandr'
         'python-pillow' 'python-requests' 'gnome-desktop' 'webkit2gtk'
         'mesa-demos' 'python-dbus' 'python-distro' 'python-magic-ahupp'
         'python-lxml')
makedepends=('git' 'python-setuptools')
#checkdepends=('xorg-server-xvfb' 'python-nose-cover3' 'wine' 'xterm')
optdepends=(
  'wine: Run windows games'
  'vulkan-icd-loader: Vulkan support'
  'lib32-vulkan-icd-loader: Vulkan support'
  'vkd3d: Vulkan 3D support'
  'lib32-vkd3d: Vulkan 3D support'
  'gvfs: GVFS backend'
  'python-evdev: Detecting connected joypads'
  'python-pypresence: Discord RPC and Rich Presence'
  'gamemode: Allows games to request a temporary set of optimisations'
  "mangohud: Display the games' FPS + other information")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lutris/lutris.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

# Tests fail in chroot

#check() {
# cd "$srcdir/${pkgname%-git}"
#	xvfb-run nosetests --cover-erase --with-xunit --xunit-file=nosetests.xml \
#		--with-coverage --cover-package=lutris --cover-xml-file=coverage.xml
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
