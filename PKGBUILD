# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

_pkgname=picard
pkgname="${_pkgname}3"
pkgver=3.0.0a1
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
arch=(x86_64)
url="https://github.com/metabrainz/picard"
license=(GPL-2.0-or-later)
provides=(picard)
conflicts=(picard)
depends=(
  glibc
  hicolor-icon-theme
  python
  python-dateutil
  python-discid
  python-fasteners
  python-markdown
  python-mutagen
  python-pyjwt
  python-pyqt5
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'chromaprint: fingerprinting'
  'qt6-multimedia: media player toolbar'
  'qt6-translations: full UI translation'
)
source=(http://data.musicbrainz.org/pub/musicbrainz/picard/picard-3.0.0a1.tar.gz)
sha256sums=('c42f12f52b50706fd151d9b3d9fcdf2a330d6506a1f02cbfd3a8690bc9979b29')
b2sums=('70958176a7bd8662accef5ab0b3034aa903649075bb4400714ecc2d0e3eeb72977f751df7b663fa97cc6bb1c6cbfdeaa57e94adeae69306dcda0dfd2b2787c4f')

build() {
  cd $_pkgname-$pkgver
  PICARD_DISABLE_AUTOUPDATE=1  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
