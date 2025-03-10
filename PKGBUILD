# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=coretoppings
pkgver=5.0.0
pkgrel=1
pkgdesc="Additional features,plugins etc for CuboCore Application Suite."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'qt6-location'
        'qt6-connectivity'
        'libpulse'
        'libxcomposite'
        'libxdamage'
        'libx11'
        'libxrender'
        'libcprime'
        'libdbusmenu-lxqt'
)
makedepends=(
            'cmake'
            'ninja'
)
optdepends=(
           'ffmpeg: For media'
           'v4l-utils: For media'
           'grim: For screencapture on wayland'
           'wf-recorder: For recording on wayland'
           'playerctl: For media controls'
           'xorg-xrandr: For rotation'
           'iio-sensor-proxy: For rotation'
           'inotify-tools: For rotation'
           'bluez-utils: For bluetooth  networking'
           'networkmanager: For Wifi and Hotspot'
           'connman: Another option for Wifi and Hostspot'
           'redshift: Qwikaccess - Nightmode'
           'xorg-xinput: Qwikaccess - Diasbling touchpad, toudhscreen etc'
           'polkit: Qwickaccess - To elevate user rights'
           'libnotify: Qwikaccess - Notifications'
           'xdg-utils: Lockscreen'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('4e334f3d872d17d4514de37564066239621777040b58bfcc301a9e0dd0bc4842')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}
