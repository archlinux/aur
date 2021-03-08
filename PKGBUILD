# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
pkgname=lutris-git
pkgver=0.5.8.3.r49.gde0f1e9e
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-dbus' 'gtk3'
         'glib2' 'psmisc' 'cabextract' 'unzip' 'p7zip' 'curl'
         'python-pillow' 'python-requests' 'webkit2gtk'
         'mesa-demos' 'python-dbus' 'python-distro' 'python-magic-ahupp'
         'python-lxml')
makedepends=('git' 'meson')
#checkdepends=('xorg-server-xvfb' 'python-nose-cover3' 'wine' 'xterm'
#              'gnome-desktop' 'pciutils' 'xorg-xrandr')
optdepends=(
  'wine: easiest way to get all the libraries missing from the Lutris runtime'
  'vulkan-icd-loader: Vulkan support'
  'lib32-vulkan-icd-loader: Vulkan support'
  'vkd3d: Vulkan 3D support'
  'lib32-vkd3d: Vulkan 3D support'
  'gvfs: GVFS backend'
  'xorg-xrandr: fetch screen resolutions on Xorg'
  'gnome-desktop: fetch screen resolutions on Wayland'
  'lib32-glibc: for 32bit games support'
  'python-evdev: for controller detection'
  'python-pypresence: Discord RPC and Rich Presence'
  'gamemode: Allows games to request a temporary set of optimisations'
  "mangohud: Display the games' FPS + other information"
  "lib32-mangohud: Display the games' FPS + other information")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lutris/lutris.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#	xvfb-run nosetests --cover-erase --with-xunit --xunit-file=nosetests.xml \
#		--with-coverage --cover-package=lutris --cover-xml-file=coverage.xml
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
