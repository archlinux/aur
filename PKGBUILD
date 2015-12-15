# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris-git
pkgver=0.3.6.2.r161.be2ab37
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'polkit' 'xorg-xrandr'
         'python2-dbus' 'python2-gobject' 'python2-xdg' 'python2-yaml')
makedepends=('git' 'python2-setuptools')
provides=('lutris')
conflicts=('lutris')
install='lutris.install'
source=('git+https://github.com/lutris/lutris.git')
sha256sums=('SKIP')

pkgver() {
  cd lutris

  printf "%s" "$(git describe | sed 's/v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd lutris

  sed -i 's|^#!.*python$|#!/usr/bin/python2|' $(grep -rl '^#!.*python')
}

package() {
  cd lutris

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
