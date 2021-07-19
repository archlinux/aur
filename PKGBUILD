# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=kodi-standalone-service-git
pkgver=v1.131.r0.g33dc373
pkgrel=1
pkgdesc="Systemd services to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64.
# You have been warned.
arch=('x86_64')
url="https://github.com/graysky2/kodi-standalone-service"
license=('MIT')
install=readme.install
depends=('polkit' 'libinput')
replaces=('kodi-standalone-x11-service' 'kodi-standalone-gbm-service' 'kodi-standalone-wayland-service')
provides=('kodi-standalone-service')
conflicts=('kodi-standalone-service')
optdepends=(
 'cage: for kodi-wayland.service'
 'xorg-server: for kodi-x11.service'
 'xorg-xinit: for kodi-x11.service'
) 
source=("${pkgname}::git+https://github.com/graysky2/kodi-standalone-service.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
