# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clight
pkgver=4.11
pkgrel=1
pkgdesc="A C daemon that turns your webcam into a light sensor. It can also change display gamma temperature, dim your screen and set your dpms."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clight"
license=('GPL-3.0-or-later')
depends=('clightd' 'gsl' 'hicolor-icon-theme' 'libconfig' 'popt')
makedepends=('git' 'cmake' 'bash-completion')
optdepends=('geoclue: to retrieve user location through geoclue.'
            'upower: to save energy by increasing timeouts between captures while on battery
                     and to autocalibrate keyboard backlight.'
            'bash-completion: to add support for bash automatic completion.'
            'clight-gui: Clight GUI written in Qt.')
backup=("etc/$pkgname/$pkgname.conf"
        "etc/$pkgname/modules.conf.d"/{backlight,daytime,dimmer,dpms,gamma,inhibit,keyboard,screen,sensor}.conf)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9a7ec2070b0e1d074477cd219d6894dde9eb85cbe83daebc22054fab29dade34')

build() {
  cmake -B build -S Clight-$pkgver \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
