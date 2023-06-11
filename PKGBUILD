# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clight-git
pkgver=4.10.r2.gc85b4aa
pkgrel=1
pkgdesc="A C daemon that turns your webcam into a light sensor. It can also change display
         gamma temperature, dim your screen and set your dpms."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clight"
license=('GPL3')
depends=('clightd-git' 'gsl' 'hicolor-icon-theme' 'libconfig' 'popt')
makedepends=('git' 'cmake' 'bash-completion')
optdepends=('geoclue: to retrieve user location through geoclue.'
            'upower: to save energy by increasing timeouts between captures while on battery
             and to autocalibrate keyboard backlight.'
            'bash-completion: to add support for bash automatic completion.'
            'clight-gui-git: Clight GUI written in Qt.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}/${pkgname%-git}.conf"
        "etc/${pkgname%-git}/modules.conf.d"/{backlight,daytime,dimmer,dpms,gamma,inhibit,keyboard,screen,sensor}.conf)
install="${pkgname%-git}.install"
source=('git+https://github.com/FedeDP/Clight.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Clight"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S Clight \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
