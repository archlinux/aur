# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=python-pyalsaaudio
_name=${pkgname#python-}
pkgver=0.10.0
pkgrel=2
pkgdesc="ALSA wrappers for Python"
arch=(x86_64 i686 armv7h)
url="https://github.com/larsimmisch/pyalsaaudio"
license=(custom:PSF)
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d63465df6bbeda637dcd1b2a9c713f2035b0b890387258db99f28158886303fe')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
