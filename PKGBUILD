# Maintainer: Damian Höster <damian.hoester@posteo.de>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jacob Mischka <jacob@mischka.me>

_pkgname=gnomecast
pkgname=$_pkgname-git
pkgver=1.9.11.r187.d42d891
pkgrel=1
pkgdesc='A native Linux GUI for casting local files to Chromecast devices'
arch=(any)
url=https://github.com/keredson/gnomecast
license=(GPL-3.0-or-later)
depends=(
  ffmpeg
  gtk3
  python-html5lib
  python-pychromecast
  python-bottle
  python-pycaption
  python-paste
  python-gobject
  python-dbus
)
makedepends=(
  git
  python-setuptools
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  local _ver=$(grep '__version__ = ' $_pkgname/gnomecast.py | head -n1 | cut -d\' -f2)
  printf '%s.r%s.%s' "$_ver" \
    "$(git -C $_pkgname rev-list --count HEAD)" \
    "$(git -C $_pkgname rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
