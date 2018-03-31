# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='persepolis-git'
pkgver=3.1.0.r0.g91aa23f
pkgrel=2
pkgdesc="A graphical front-end for aria2 download manager with lots of features (Github version)."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'libnotify' 'libpulse' 'python' 'python-psutil' 'python-pyqt5' 'python-requests' 'python-setproctitle' 'qt5-svg' 'sound-theme-freedesktop' 'youtube-dl')
makedepends=('git' 'python-setuptools')
optdepends=('adwaita-qt5: for using adwaita style in GTK based Desktops.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/persepolisdm/persepolis.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  gzip -k -9 ./man/persepolis.1
}

package() {
  cd ${pkgname}
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
# vim:set ts=2 sw=2 et:
