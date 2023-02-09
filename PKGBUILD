# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
pkgname=lutris-git
pkgver=0.5.12.r299.g83b037cc
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('cabextract' 'curl' 'glib2' 'gtk3' 'mesa-utils' 'p7zip' 'psmisc'
         'python-certifi' 'python-dbus' 'python-distro' 'python-gobject'
         'python-lxml' 'python-pillow' 'python-requests' 'python-yaml' 'unzip'
         'webkit2gtk-4.1' 'xdg-utils' 'xorg-xrandr')
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
  'libstrangle: Set FPS limit'
  'linux-steam-integration: start Steam with LSI'
  "mangohud: Display the games' FPS + other information"
  'python-evdev: Controller support'
  'python-moddb: Handle ModDB downloads in installers'
  'python-pefile: Extract icons from Windows executables'
  'python-protobuf: BattleNet support'
  'python-pypresence: Discord Rich Presence integration'
  'vkd3d: Vulkan 3D support'
  'vulkan-icd-loader: Vulkan support'
  'wine: easiest way to get all the libraries missing from the Lutris runtime'
  'winetricks: use system winetricks'
  'xemu: support for Xbox games'
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
  # Isolate ~/.local/share/lutris, ~/.config/lutris and ~/.cache/lutris
#  cd "$srcdir/${pkgname%-git}"
#  export NO_AT_BRIDGE=1
#  HOME=tmp xvfb-run --auto-servernum make test
}

package() {
  meson install -C build --destdir "$pkgdir"
}
