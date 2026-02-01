# Contributor: Jörg Thalheim <joerg@higgsboson.tk
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>

pkgname=python-mpd2-git
pkgver=3.0.4.r132.gae4f8ef
pkgrel=1
pkgdesc="Python MPD client library"
url="http://github.com/Mic92/python-mpd2"
arch=('any')
license=('LGPL-3.0-or-later')
depends=('python')
makedepends=(git python-build python-installer python-wheel python-setuptools)
conflicts=('python-mpd2')
provides=('python-mpd2')
source=("git+https://github.com/Mic92/python-mpd2.git")
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd ${pkgname%-git}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname%-git}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
