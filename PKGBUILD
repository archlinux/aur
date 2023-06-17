# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=python-pyalsaaudio
_name=${pkgname#python-}
pkgver=0.10.0
pkgrel=1
pkgdesc="ALSA wrappers for Python"
arch=(x86_64 i686 armv7h)
url="https://github.com/larsimmisch/pyalsaaudio"
license=(custom:PSF)
depends=(alsa-lib)
makedepends=(python-setuptools)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d63465df6bbeda637dcd1b2a9c713f2035b0b890387258db99f28158886303fe')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
