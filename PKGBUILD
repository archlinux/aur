# Maintainer: gandalf3 <zzyxpaw at gmail dot com>
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify-git
_pkgname="mopidy-spotify"
pkgver=4.1.1.r67.g984151a
pkgrel=3
pkgdesc="Mopidy extension for playing music from Spotify (git version)"
arch=('any')
url="https://github.com/mopidy/mopidy-spotify"
license=('Apache-2.0')
conflicts=('mopidy-spotify')
provides=("mopidy-spotify=$pkgver")
depends=(
  'mopidy>=3.4'
  python-pykka
  python-requests
  gst-plugins-rs
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
install=mopidy-spotify.install
source=(git+https://github.com/mopidy/mopidy-spotify.git#branch=main)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

