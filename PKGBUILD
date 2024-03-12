# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=python-pyalsaaudio
_pkgname=${pkgname#python-}
pkgver=0.10.0
pkgrel=3
pkgdesc="ALSA wrappers for Python"
arch=(x86_64 i686 armv7h)
url="https://github.com/larsimmisch/pyalsaaudio"
license=(LicenseRef-PSF-For-Python-2.4)
depends=(
  alsa-lib
  glibc
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6d3555fc4a84d969cfe160b651a3744aa479adb74299aa87a026c9283db19fdf')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
