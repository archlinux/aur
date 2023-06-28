# Maintainer: gandalf3 <zzyxpaw at gmail dot com>
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify-git
_pkgname="mopidy-spotify"
pkgver=4.1.1.r67.g984151a
pkgrel=2
pkgdesc="Mopidy extension for playing music from Spotify (git version)"
arch=('any')
url="https://github.com/mopidy/mopidy-spotify"
license=('APACHE')
conflicts=('mopidy-spotify')
provides=("mopidy-spotify=$pkgver")
depends=(
  'mopidy>=3.4'
  python-pykka
  python-requests
  gst-plugins-rs
)
makedepends=(
  python-setuptools
)
install=mopidy-spotify.install
source=(git+https://github.com/mopidy/mopidy-spotify.git)
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${_pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir/${_pkgname}"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

