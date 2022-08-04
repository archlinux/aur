# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
pkgname=lutris-git
pkgver=0.5.10.1.r147.g7e035c36
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('cabextract' 'curl' 'glib2' 'gtk3' 'mesa-utils' 'p7zip' 'psmisc'
         'python-dbus' 'python-distro' 'python-gobject' 'python-lxml'
         'python-pillow' 'python-requests' 'python-yaml' 'unzip'
         'webkit2gtk' 'xdg-utils' 'xorg-xrandr')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
#checkdepends=('appstream-glib' 'libcanberra' 'pciutils' 'python-nose2'
#              'xorg-server-xvfb' 'xterm')
optdepends=(
  'gamemode: Allows games to request a temporary set of optimisations'
  'gamescope: Draw the game window isolated from your desktop'
  'gnome-desktop: Get display and resolution using GnomeDesktop'
  'gvfs: GVFS backend'
  'innoextract: Extract Inno Setup installers'
  'lib32-gamemode: Allows games to request a temporary set of optimisations'
  'lib32-glibc: for 32bit games support'
  "lib32-mangohud: Display the games' FPS + other information"
  'lib32-vkd3d: Vulkan 3D support'
  'lib32-vulkan-icd-loader: Vulkan support'
  'linux-steam-integration: start Steam with LSI'
  "mangohud: Display the games' FPS + other information"
  'python-evdev: Controller support'
  'vkd3d: Vulkan 3D support'
  'vulkan-icd-loader: Vulkan support'
  'wine: easiest way to get all the libraries missing from the Lutris runtime'
  'winetricks: use system winetricks'
  'xorg-xgamma: Restore gamma on game exit')
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

check() {
  meson test -C build --print-errorlogs

  # Run test suite
  # Will produce errors if ~/.local/share/lutris, ~/.config/lutris
  # and ~/.cache/lutris are not avialable / writable
#  cd "$srcdir/${pkgname%-git}"
#  xvfb-run --auto-servernum make test
}

package() {
  meson install -C build --destdir "$pkgdir"
}
