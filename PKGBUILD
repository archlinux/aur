# Maintainer: Magillos <kerown at gmail com>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=python-pyalsaaudio
_pkgname=${pkgname#python-}
pkgver=0.11.0
pkgrel=1
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
sha256sums=('4609d0181a85a3ed5491d362a5450b957c5ba5fd43cd23d1e5895d6736e2d083')

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
